import urllib.request
import re

req = urllib.request.Request('https://pngimg.com', headers={'User-Agent': 'Mozilla/5.0'})
with urllib.request.urlopen(req) as resp:
    html = resp.read().decode('utf-8', errors='ignore')
    links = set(re.findall(r'href="([^"]*clothes[^"]*)"', html, re.I))
    print('Clothes links:', links)
    links2 = set(re.findall(r'href="([^"]*(?:jacket|shirt|dress|jeans|pants|sweater|coat|shoes)[^"]*)"', html, re.I))
    print('Other clothing links:', sorted(list(links2))[:30])
