
"""
> reads temperature from log file
> calculates temperature stats
> writes temperature stats to file
> input/output files specifies as CLI args
   [ python3 get_stats.py temp.log temp_stats.csv ]

"""

import sys
import csv

input_file = sys.argv[1]
output_file = sys.argv[2]

temps = []

with open(input_file, 'r') as f:
    for line in f:
        try:
            temp_str = line.strip().split('-')[-1].strip().replace('°C', '')
            temp = float(temp_str)
            temps.append(temp)
        except:
            continue

if not temps:
    print("No valid readings")
    sys.exit(1)

min_temp = min(temps)
max_temp = max(temps)
avg_temp = sum(temps) / len(temps)

with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Min Temp', 'Max Temp', 'Avg Temp'])
    writer.writerow([min_temp, max_temp, round(avg_temp, 2)])


