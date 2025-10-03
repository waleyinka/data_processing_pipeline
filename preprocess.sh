#!/bin/bash


RAW_DATA=/home/omowalefst/data_pipeline/input/sales_data.csv
REPORT_LOG=/home/omowalefst/data_pipeline/logs/preprocess.log
CLEANED_DATA=/home/omowalefst/data_pipeline/output/cleaned_sales_data.csv
CURRENT_DATE_TIME=$(date +"%Y-%m-%d %T")


# USING AWK
# ...with condition ($6 != "Failed") to return everything except the row with keyword "Failed" on column 6
# ...with print ($1, $2, $3, $4, $5, $6) to return columns 1-6
awk -F, 'BEGIN {OFS=","} $6 != "Failed" {print $1, $2, $3, $4, $5, $6}' $RAW_DATA > $CLEANED_DATA


# ALTERNATIVELY USING CUT/PIPE/GREP
# ...cut (returns column 1-6), and grep -v (filters the piped result to return only the rows without the keyword "Failed")
# cut -f 1-6 -d "," $RAW_DATA | grep -v "Failed" > $CLEANED_DATA


echo "Data cleaning job done successfully at $CURRENT_DATE_TIME" > $REPORT_LOG
echo -e "\n1. I removed the unwanted column (extra_column)" >> $REPORT_LOG
echo -e "\n2. I filtered out rows where status = 'Failed'" >> $REPORT_LOG
echo -e "\n3. The cleaned version has been saved into $CLEANED_DATA" >> $REPORT_LOG


echo "All done! Check $REPORT_LOG for status"
