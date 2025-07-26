#!/bin/bash
#!/bin/bash
echo "Script ran at $(date)" >> /home/ismail/Desktop/practise/IBM/debug.log

LOG_FILE="/home/ismail/Desktop/practise/IBM/temp.log"
STATS_FILE="/home/ismail/Desktop/practise/IBM/temp_stats.csv"

# 1. Extract temperature
/home/ismail/Desktop/practise/IBM/get_temp_api.sh >> "$LOG_FILE"

# 2. Keep only last 6 lines 
tail -n 6 "$LOG_FILE" > "$LOG_FILE.tmp" && mv "$LOG_FILE.tmp" "$LOG_FILE"

# 3. Transform: Calculate stats
python3 /home/ismail/Desktop/practise/IBM/get_stats.py "$LOG_FILE" "$STATS_FILE"

# 4. Load: Push stats to DB or print
/home/ismail/Desktop/practise/IBM/load_stats_api.sh "$STATS_FILE"


