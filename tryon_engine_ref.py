"""
Virtual Try-On Engine
Core module for pose detection and clothing overlay using MediaPipe + OpenCV
"""

import cv2
import numpy as np
import mediapipe as mp
from dataclasses import dataclass
from typing import Optional, Tuple, List
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@dataclass
class PoseKeypoints:
    """Holds key body landmark positions"""
    left_shoulder: Optional[Tuple[int, int]] = None
    right_shoulder: Optional[Tuple[int, int]] = None
    left_hip: Optional[Tuple[int, int]] = None
    right_hip: Optional[Tuple[int, int]] = None
    left_elbow: Optional[Tuple[int, int]] = None
    right_elbow: Optional[Tuple[int, int]] = None
    left_wrist: Optional[Tuple[int, int]] = None
    right_wrist: Optional[Tuple[int, int]] = None
    nose: Optional[Tuple[int, int]] = None
    confidence: float = 0.0

    @property
    def shoulder_width(self) -> Optional[int]:
        if self.left_shoulder and self.right_shoulder:
            return abs(self.right_shoulder[0] - self.left_shoulder[0])
        return None

    @property
    def torso_height(self) -> Optional[int]:
        if self.left_shoulder and self.left_hip:
            return abs(self.left_hip[1] - self.left_shoulder[1])
        return None

    @property
    def shoulder_center(self) -> Optional[Tuple[int, int]]:
        if self.left_shoulder and self.right_shoulder:
            return (
                (self.left_shoulder[0] + self.right_shoulder[0]) // 2,
                (self.left_shoulder[1] + self.right_shoulder[1]) // 2,
            )
        return None

    @property
    def is_valid(self) -> bool:
        return all([
            self.left_shoulder, self.right_shoulder,
            self.left_hip, self.right_hip
        ])


class PoseDetector:
    """MediaPipe-based pose landmark detector"""

    # Landmark indices
    LANDMARKS = {
        "nose": 0,
        "left_shoulder": 11,
        "right_shoulder": 12,
        "left_elbow": 13,
        "right_elbow": 14,
        "left_wrist": 15,
        "right_wrist": 16,
        "left_hip": 23,
        "right_hip": 24,
    }

    def __init__(
        self,
        min_detection_confidence: float = 0.6,
        min_tracking_confidence: float = 0.5,
        smooth_landmarks: bool = True,
    ):
        self.mp_pose = mp.solutions.pose
        self.mp_drawing = mp.solutions.drawing_utils
        self.mp_drawing_styles = mp.solutions.drawing_styles

        self.pose = self.mp_pose.Pose(
            min_detection_confidence=min_detection_confidence,
            min_tracking_confidence=min_tracking_confidence,
            smooth_landmarks=smooth_landmarks,
            model_complexity=1,
        )
        logger.info("PoseDetector initialized")

    def detect(self, frame: np.ndarray) -> Tuple[np.ndarray, Optional[PoseKeypoints]]:
        """
        Detect pose landmarks in a frame.
        Returns (annotated_frame, keypoints)
        """
        rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = self.pose.process(rgb)

        keypoints = None
        if results.pose_landmarks:
            h, w = frame.shape[:2]
            lm = results.pose_landmarks.landmark

            def get_point(idx: int) -> Optional[Tuple[int, int]]:
                pt = lm[idx]
                if pt.visibility > 0.4:
                    return (int(pt.x * w), int(pt.y * h))
                return None

            keypoints = PoseKeypoints(
                nose=get_point(self.LANDMARKS["nose"]),
                left_shoulder=get_point(self.LANDMARKS["left_shoulder"]),
                right_shoulder=get_point(self.LANDMARKS["right_shoulder"]),
                left_elbow=get_point(self.LANDMARKS["left_elbow"]),
                right_elbow=get_point(self.LANDMARKS["right_elbow"]),
                left_wrist=get_point(self.LANDMARKS["left_wrist"]),
                right_wrist=get_point(self.LANDMARKS["right_wrist"]),
                left_hip=get_point(self.LANDMARKS["left_hip"]),
                right_hip=get_point(self.LANDMARKS["right_hip"]),
                confidence=results.pose_landmarks.landmark[
                    self.LANDMARKS["left_shoulder"]
                ].visibility,
            )

        return frame, keypoints

    def draw_skeleton(self, frame: np.ndarray, keypoints: PoseKeypoints) -> np.ndarray:
        """Draw skeleton overlay for debugging"""
        overlay = frame.copy()
        color = (0, 255, 180)
        thickness = 2

        connections = [
            (keypoints.left_shoulder, keypoints.right_shoulder),
            (keypoints.left_shoulder, keypoints.left_elbow),
            (keypoints.right_shoulder, keypoints.right_elbow),
            (keypoints.left_elbow, keypoints.left_wrist),
            (keypoints.right_elbow, keypoints.right_wrist),
            (keypoints.left_shoulder, keypoints.left_hip),
            (keypoints.right_shoulder, keypoints.right_hip),
            (keypoints.left_hip, keypoints.right_hip),
        ]

        for pt1, pt2 in connections:
            if pt1 and pt2:
                cv2.line(overlay, pt1, pt2, color, thickness)

        for field in keypoints.__dataclass_fields__:
            pt = getattr(keypoints, field)
            if isinstance(pt, tuple):
                cv2.circle(overlay, pt, 5, (255, 80, 0), -1)

        return overlay

    def release(self):
        self.pose.close()


class ClothingOverlay:
    """Handles resizing and blending clothing images onto the body"""

    def __init__(self, scale_factor: float = 1.15, vertical_offset: float = 0.0):
        """
        scale_factor: extra width padding (1.15 = 15% wider than shoulders)
        vertical_offset: shift overlay up/down as fraction of torso height
        """
        self.scale_factor = scale_factor
        self.vertical_offset = vertical_offset

    def _compute_transform(
        self,
        keypoints: PoseKeypoints,
        clothing_img: np.ndarray,
        frame_shape: Tuple[int, int],
    ) -> Optional[Tuple[np.ndarray, Tuple[int, int, int, int]]]:
        """
        Compute where and how large to place the clothing overlay.
        Returns (resized_clothing_rgba, (x, y, w, h)) or None.
        """
        if not keypoints.is_valid:
            return None

        shoulder_w = keypoints.shoulder_width
        torso_h = keypoints.torso_height

        if not shoulder_w or not torso_h or shoulder_w < 30:
            return None

        # Target dimensions
        target_w = int(shoulder_w * self.scale_factor * 1.6)
        aspect = clothing_img.shape[0] / clothing_img.shape[1]
        target_h = int(target_w * aspect)

        # Clamp to frame
        fh, fw = frame_shape[:2]
        target_w = min(target_w, fw)
        target_h = min(target_h, fh)

        resized = cv2.resize(clothing_img, (target_w, target_h), interpolation=cv2.INTER_AREA)

        # Position: center on shoulders, top at shoulder line
        cx, cy = keypoints.shoulder_center
        x = cx - target_w // 2
        y = cy - int(target_h * 0.12) + int(torso_h * self.vertical_offset)

        return resized, (x, y, target_w, target_h)

    def apply(
        self,
        frame: np.ndarray,
        clothing_rgba: np.ndarray,
        keypoints: PoseKeypoints,
        opacity: float = 1.0,
    ) -> np.ndarray:
        """
        Blend clothing_rgba (BGRA) onto frame using alpha channel.
        Returns the composited frame.
        """
        result = self._compute_transform(keypoints, clothing_rgba, frame.shape)
        if result is None:
            return frame

        resized, (x, y, w, h) = result
        fh, fw = frame.shape[:2]

        # Crop to frame bounds
        x1, y1 = max(x, 0), max(y, 0)
        x2, y2 = min(x + w, fw), min(y + h, fh)

        if x2 <= x1 or y2 <= y1:
            return frame

        # Corresponding region in the clothing image
        cx1 = x1 - x
        cy1 = y1 - y
        cx2 = cx1 + (x2 - x1)
        cy2 = cy1 + (y2 - y1)

        clothing_crop = resized[cy1:cy2, cx1:cx2]
        if clothing_crop.shape[2] == 4:
            alpha = clothing_crop[:, :, 3:4].astype(np.float32) / 255.0 * opacity
            bgr = clothing_crop[:, :, :3].astype(np.float32)
        else:
            alpha = np.ones((*clothing_crop.shape[:2], 1), dtype=np.float32) * opacity
            bgr = clothing_crop.astype(np.float32)

        roi = frame[y1:y2, x1:x2].astype(np.float32)
        blended = roi * (1 - alpha) + bgr * alpha
        frame[y1:y2, x1:x2] = blended.astype(np.uint8)
        return frame


class VirtualTryOn:
    """
    Main orchestrator: webcam → pose detection → clothing overlay → display
    """

    def __init__(self, camera_index: int = 0, width: int = 1280, height: int = 720):
        self.camera_index = camera_index
        self.width = width
        self.height = height

        self.detector = PoseDetector()
        self.overlay = ClothingOverlay()

        self.clothing_images: List[np.ndarray] = []
        self.clothing_names: List[str] = []
        self.current_index: int = 0

        self.show_skeleton = False
        self.show_landmarks = False
        self.opacity = 0.95
        self.cap: Optional[cv2.VideoCapture] = None

    def load_clothing(self, paths: List[str], names: Optional[List[str]] = None):
        """Load clothing images (PNG with transparency recommended)"""
        self.clothing_images.clear()
        self.clothing_names.clear()

        for i, path in enumerate(paths):
            img = cv2.imread(path, cv2.IMREAD_UNCHANGED)
            if img is None:
                logger.warning(f"Could not load: {path}")
                continue

            if img.shape[2] == 3:
                # Add alpha channel (fully opaque)
                alpha = np.ones((*img.shape[:2], 1), dtype=np.uint8) * 255
                img = np.concatenate([img, alpha], axis=2)

            self.clothing_images.append(img)
            name = names[i] if names and i < len(names) else f"Item {i+1}"
            self.clothing_names.append(name)
            logger.info(f"Loaded: {name} ({img.shape[1]}x{img.shape[0]})")

        logger.info(f"Total items loaded: {len(self.clothing_images)}")

    @property
    def current_clothing(self) -> Optional[np.ndarray]:
        if self.clothing_images:
            return self.clothing_images[self.current_index]
        return None

    @property
    def current_name(self) -> str:
        if self.clothing_names:
            return self.clothing_names[self.current_index]
        return "No item"

    def next_item(self):
        if self.clothing_images:
            self.current_index = (self.current_index + 1) % len(self.clothing_images)

    def prev_item(self):
        if self.clothing_images:
            self.current_index = (self.current_index - 1) % len(self.clothing_images)

    def _draw_ui(self, frame: np.ndarray, keypoints: Optional[PoseKeypoints]) -> np.ndarray:
        """Draw HUD overlay"""
        h, w = frame.shape[:2]

        # Top bar
        cv2.rectangle(frame, (0, 0), (w, 52), (10, 10, 10), -1)
        cv2.putText(frame, "Virtual Try-On", (16, 34),
                    cv2.FONT_HERSHEY_DUPLEX, 1.0, (255, 255, 255), 1)

        # Item name
        if self.clothing_names:
            label = f"[{self.current_index + 1}/{len(self.clothing_names)}] {self.current_name}"
            cv2.putText(frame, label, (w // 2 - 160, 34),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.65, (180, 220, 255), 1)

        # Pose status
        status = "Pose Detected ✓" if (keypoints and keypoints.is_valid) else "Stand in Frame"
        color = (0, 220, 100) if (keypoints and keypoints.is_valid) else (0, 120, 255)
        cv2.putText(frame, status, (w - 220, 34),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, color, 1)

        # Bottom controls
        controls = "[A/D] Switch Item  [S] Skeleton  [+/-] Opacity  [Q] Quit"
        cv2.rectangle(frame, (0, h - 36), (w, h), (10, 10, 10), -1)
        cv2.putText(frame, controls, (10, h - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.5, (160, 160, 160), 1)

        # Opacity indicator
        cv2.putText(frame, f"Opacity: {self.opacity:.0%}", (w - 160, h - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.45, (140, 180, 255), 1)

        return frame

    def run(self):
        """Main loop"""
        self.cap = cv2.VideoCapture(self.camera_index)
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH, self.width)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT, self.height)

        if not self.cap.isOpened():
            raise RuntimeError(f"Cannot open camera {self.camera_index}")

        logger.info("Starting Virtual Try-On. Press Q to quit.")
        cv2.namedWindow("Virtual Try-On", cv2.WINDOW_NORMAL)

        while True:
            ret, frame = self.cap.read()
            if not ret:
                logger.error("Failed to capture frame")
                break

            frame = cv2.flip(frame, 1)  # Mirror mode
            frame, keypoints = self.detector.detect(frame)

            # Apply clothing
            if self.current_clothing is not None and keypoints and keypoints.is_valid:
                frame = self.overlay.apply(frame, self.current_clothing, keypoints, self.opacity)

            # Optional skeleton
            if self.show_skeleton and keypoints:
                frame = self.detector.draw_skeleton(frame, keypoints)

            frame = self._draw_ui(frame, keypoints)
            cv2.imshow("Virtual Try-On", frame)

            key = cv2.waitKey(1) & 0xFF
            if key == ord("q") or key == 27:
                break
            elif key == ord("d") or key == 83:   # Right arrow / D
                self.next_item()
            elif key == ord("a") or key == 81:   # Left arrow / A
                self.prev_item()
            elif key == ord("s"):
                self.show_skeleton = not self.show_skeleton
            elif key == ord("+") or key == ord("="):
                self.opacity = min(1.0, self.opacity + 0.05)
            elif key == ord("-"):
                self.opacity = max(0.1, self.opacity - 0.05)

        self.release()

    def release(self):
        if self.cap:
            self.cap.release()
        cv2.destroyAllWindows()
        self.detector.release()
        logger.info("Released all resources")
