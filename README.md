# Data Processing Pipeline (Bash/Linux)

## Project Overview

This repository is a Data Processing Pipeline built entirely using Linux commands and Bash scripting. The project was developed as part of deliverable for the DEC LaunchPad program, and covers file manipulation, system administration, security(permission management), and process automation via cron.

The pipeline ingests raw sales data, performs data cleaning, and ensures data integrity through continuous log monitoring, with the entire system tightly secured and scheduled for autonomous operation.

## File Structure

The project maintains a clean, organized structure to isolate raw data, processed output, and system logs.

```markdown

~/data_pipeline/
├── input/
│   └── sales_data.csv
├── logs/
│   ├── preprocess.log
│   └── monitor_summary.txt
├── output/
│   └── cleaned_sales_data.csv
├── monitor.sh
└── preprocess.sh


