#!/bin/bash


URL="https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"

INPUT_DIR=~/data_pipeline/input
LOG_DIR=~/data_pipeline/logs
OUTPUT_DIR=~/data_pipeline/output

RAW_DATA=$INPUT_DIR/sales_data.csv
REPORT_LOG=$LOG_DIR/preprocess.log
CLEANED_DATA=$OUTPUT_DIR/cleaned_sales_data.csv
CURRENT_DATE_TIME=$(date +"%Y-%m-%d %T")


echo "--- Downloading sales data for $CURRENT_DATE_TIME ---"

if wget "$URL" -q -O "$RAW_DATA"; then
	echo -e "\n✅ Sales data downloaded successfully. File path = $RAW_DATA"
	
	echo "✅ Sales_data.csv for $CURRENT_DATE_TIME downloaded successfully!" >> "$REPORT_LOG"
	
	# If file download is successful, then perform data transformation

	# USING AWK
	# ...with condition ($6 != "Failed") to return everything except the row with keyword "Failed" on column 6
	# ...with print ($1, $2, $3, $4, $5, $6) to return columns 1-6
	
	awk -F, 'BEGIN {OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}' $RAW_DATA > $CLEANED_DATA	

	# ALTERNATIVELY USING CUT/PIPE/GREP
	# ...cut (returns column 1-6), and grep -v (filters the piped result to return only the rows without the keyword "Failed")
	# cut -f 1-6 -d "," $RAW_DATA | grep -v "Failed" > $CLEANED_DATA

	echo -e "\n✅ Data transformation done successfully! Cleaned file path = $CLEANED_DATA"
	echo "Data cleaning job done successfully at $CURRENT_DATE_TIME" >> $REPORT_LOG
	echo -e "\nRemoved unwanted column (extra_column), and filtered out rows where status = 'Failed'" >> $REPORT_LOG
	echo -e "\nThe cleaned version has been saved into $CLEANED_DATA" >> $REPORT_LOG
	
else
	echo "Download failed. Could not fetch sales data from $URL"
	echo "❌ Failed to download sales_data.csv for $CURRENT_DATE_TIME from $URL" >> "$REPORT_LOG"
fi
