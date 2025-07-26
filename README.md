
# A Mini ETL demo

## 1- Extract reading with get_temp_api
## 2- Append reading to temp.log
     get_temp_api >> temp.log

## 3- Buffer last hour of reading
     tail -60 temp.log > temp.log

## 4- Call get_stats.py to aggregate the readings
     python3 get_stats.py temp.log temp_stats.csv

## 5- Load the stats using load_stats_api
     load_stats_api temp_stats.csv

## SCHEDULING ETL JOB
     Open crontab editor -> $ crontab -e
     Enter schedule -> 1 * * * * abs/path/temp_etl.sh
     Close and save



