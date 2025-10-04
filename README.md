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
```

## Automation and Scheduling (Cron)

The pipeline's core strength lies in its automation, managed via the Linux cron scheduler.

1. preprocess.sh (ETL)

This script is responsible for:

- Reading *sales_data.csv* from the *input/* directory.

- Performing data cleaning including removing unwanted column, fitering out rows.

- Saving the final, cleaned data to *output/cleaned_sales_data.csv*.

- Logging all activities to *logs/preprocess.log*.

- ***Schedule:*** Currently set to run daily at 12:00 AM ```0 0 * * *```.

2. monitor.sh (Continuous Integrity Check)**

This script provides continuous oversight of the system's health.

- Search for critical patterns (e.g., "ERROR" or "FAILED") in log file.

- Generates a concise status report, if errors are found, write them to a summary file *monitor_summary.txt*.

- ***Schedule:*** Currently set to run daily at 12:05 AM ```5 0 * * *```.
 
## Crontab Configuration *(crontab -e view)*

<img width="1919" height="1019" alt="crontab-e" src="https://github.com/user-attachments/assets/78b5e0f3-dd5b-42a9-b297-3d65beb5ef1c" />

## Active Job Confirmation *(crontab -l view)*

<img width="1919" height="762" alt="crontab-l" src="https://github.com/user-attachments/assets/a871cfbd-5e58-4fc5-bd44-8da9406a7071" />

## File Permissions

<img width="1909" height="435" alt="permissions" src="https://github.com/user-attachments/assets/eb8da5ed-2a58-427c-8d47-044790039d89" />
