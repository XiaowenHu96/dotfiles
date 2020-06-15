#!/usr/bin/python

import subprocess
import re

raw = subprocess.run(["acpi"], capture_output=True)
bs = raw.stdout.decode("utf-8").lower().split('\n')[0:-1]

ischarging = False;
perc = 0;
num_batteries = len(bs)

for b in bs:
    match = re.search("charging|full|discharging|unknown", b)
    if (match is None):
        break

    state = match.group(0)
    b = b[match.end(0):]
    if state == "charging":
        ischarging = True;
    
    match = re.search("\d+", b)
    p = match.group(0)
    perc += int(p)

charging = ['', '', '', '', '']
discharging = ['', '', '', '', '']

if ischarging:
    states = charging
else:
    states = discharging

perc = int(perc / num_batteries)
if perc == 100:
    symbol = states[0]
    color = "#77DD76"
elif perc >= 75:
    symbol = states[1]
    color = "#BDE7BD"
elif perc >= 50:
    symbol = states[2]
    color = "#FFA820"
elif perc >= 30:
    symbol = states[3]
    color = "#E60011"
else:
    symbol = states[4]
    color = "#E60011"

if not ischarging and perc >= 50:
    color = "#FFA820"

print ("<fc=", color, ">", symbol, " (", perc, "%)", "</fc>", sep='')
