#!/bin/bash

LOG_DIR=~/data_pipeline/logs
LOG_FILE=$LOG_DIR/preprocess.log
LOG_SUMMARY=$LOG_DIR/monitor_summary.log
CURRENT_DATE_TIME=$(date +"%Y-%m-%d %T")

echo -e  "\n=============================================" >> $LOG_SUMMARY

echo -e "\n--- Log Analysis Report $CURRENT_DATE_TIME ---" >> $LOG_SUMMARY

echo -e "\n----------------------------------------------" >> $LOG_SUMMARY

ERRORS=$(grep -iE "ERROR|FAILED" "$LOG_FILE")

if [[ -z "$ERRORS" ]]; then
	echo -e "\n✅ SUCCESS: No errors found in $LOG_FILE" >> $LOG_SUMMMARY
else
	ERROR_COUNT=$(echo "ERRORS" | grep -c .)
	echo -e "\n🚨 ATTENTION NEEDED: Found $ERROR_COUNT error line(s) in $LOG_FILE" >> $LOG_SUMMARY
fi

echo "Log analysis for $CURRENT_DATE_TIME completed and result saved in: $LOG_SUMMARY"
