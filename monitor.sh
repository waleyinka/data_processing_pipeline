#!/bin/bash


# There would two log files, preprocess.log and preprocess_cronjob.log both saved inside Log_dir

LOG_DIR="/home/omowalefst/data_pipeline/logs"
ERROR_PATTERNS=("ERROR" "FAILED" "CRITICAL")


echo "--- Log Analysis Report ($(date)) ---"


for LOG_FILE in "$LOG_DIR"/*.log; do

	for PATTERN in ${ERROR_PATTERNS[@]}; do
 		echo -e "\nSearching for $PATTERN logs in $LOG_FILE file"
		grep "$PATTERN" "$LOG_FILE"

		echo -e "\nNumber of $PATTERN logs found in $LOG_FILE file"
		ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
		echo "$ERROR_COUNT"

		if [ "$ERROR_COUNT" -gt 0 ]; then
			echo -e "\n 🚨 ATTENTION NEEDED: There are $ERROR_COUNT $PATTERN Error(s) found in: $LOG_FILE"
		else
			echo "✅ SUCCESS: No $PATTERN patterns found in $LOG_FILE"
		fi
	done
done
	
echo -e "\nLog analysis completed"
