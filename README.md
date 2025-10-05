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
│   └── monitor_summary.log
├── output/
│   └── cleaned_sales_data.csv
├── monitor.sh
└── preprocess.sh
```

## Automation and Scheduling (Cron)

The pipeline's core strength lies in its automation, managed via the Linux cron scheduler.

1. preprocess.sh (ETL)

This script is responsible for:

- Reading ***sales_data.csv*** from the ***input/*** directory.

- Performing data cleaning including removing unwanted column, fitering out rows.

- Saving the final, cleaned data to ***output/cleaned_sales_data.csv***.

- Logging all activities to ***logs/preprocess.log***.

- ***Schedule:*** Currently set to run daily at 12:00 AM ```0 0 * * *```.

2. monitor.sh (Continuous Integrity Check)

- Search for critical patterns (e.g., "ERROR" or "FAILED") in log file.

- Generates a concise status report, if errors are found, write them to a summary file *monitor_summary.txt*.

- ***Schedule:*** Currently set to run daily at 12:05 AM ```5 0 * * *```.
 
## Crontab Configuration *(crontab -e view)*

<img width="1917" height="1011" alt="crontab-e" src="https://github.com/user-attachments/assets/086f191e-5a4b-4279-a1a1-41ca83cdb4f8" />

## Active Job Confirmation *(crontab -l view)*

<img width="1918" height="885" alt="crontab-l" src="https://github.com/user-attachments/assets/e0cd91af-c419-446e-b067-59dd8a7f8ca1" />

## File Permissions

<img width="1909" height="435" alt="permissions" src="https://github.com/user-attachments/assets/eb8da5ed-2a58-427c-8d47-044790039d89" />
