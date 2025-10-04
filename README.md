# Data Processing Pipeline (Bash/Linux)

## Project Overview

This repository is a Data Processing Pipeline built entirely using Linux commands and Bash scripting. The project was developed as part of deliverable for the DEC LaunchPad program, and covers file manipulation, system administration, security(permission management), and process automation via cron.

The pipeline ingests raw sales data, performs data cleaning, and ensures data integrity through continuous log monitoring, with the entire system tightly secured and scheduled for autonomous operation.

## File Structure

The project maintains a clean, organized structure to isolate raw data, processed output, and system logs.

```markdown

| Directory/File | Purpose | Security Note |
| :--- | :--- | :--- |
| **`input/`** | Repository for raw input files (e.g., `sales_data.csv`). | **Highly Restricted** (Only owner can write). |
| **`output/`** | Storage for cleaned and processed data. | Standard access. |
| **`logs/`** | Contains all operational and monitoring records. | **Restricted Access** (Only owner and authorized group can read). |
| **`preprocess.sh`** | Core script for data cleaning, transformation, and validation. | Executes the primary ETL logic. |
| **`monitor.sh`** | Script for log analysis, error detection, and generating status reports. | Scheduled to run every 5 minutes. |
| **`README.md`** | This documentation file. | |
