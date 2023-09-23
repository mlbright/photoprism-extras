#!/usr/bin/env python3

import json
import sys


lines = []
for line in sys.stdin.readlines():
    lines.append(line.strip())

photos = {}
photos["photos"] = lines

print(json.dumps(photos))
