#!/bin/bash


LOG_DIR="/home/omowalefst/data_pipeline/logs"
LOG_FILE="$LOG_DIR/preprocess.log"
ERROR_PATTERNS=("ERROR" "FAILED")
REPORT_FILE="/home/omowalefst/data_pipeline/logs/monitor_summary.log"

echo "--- Log Analysis Report ($(date)) ---"

echo -e "\n======================================"

for PATTERN in "${ERROR_PATTERNS[@]}"; do
	echo -e "\nSearching for $PATTERN logs in $LOG_FILE..."

	ERROR_COUNT=$(grep -c -i "$PATTERN" "$LOG_FILE")
 	echo "Number of '$PATTERN' lines found: $ERROR_COUNT"

	if [ "$ERROR_COUNT" -eq 0 ]; then
		echo "✅ SUCCESS: No $PATTERN found."
	else
		echo -e "🚨 ATTENTION NEEDED: There are $ERROR_COUNT $PATTERN line(s) in $LOG_FILE"
	fi
done


echo -e "\nLog analysis completed and result saved in: $REPORT_FILE"
