# Log Analysis Script

A Bash script to scan `.log` files modified in the last 24 hours, search for error patterns, and generate a report.

## Features
- Looks for `ERROR`, `FATAL`, and `CRITICAL` entries.
- Saves results to `log_analysis_report.txt`.
- Counts matches per file and per pattern.
- Prints a terminal warning if more than 10 issues are found.

## Usage
```bash
chmod +x log_analysis.sh
./log_analysis.sh
````

## Customize

* Change the log folder: `LOG_DIR="/path/to/logs"`
* Add/remove patterns: `ERROR_PATTERNS=(...)`
* Change report location: `REPORT_FILE="/path/to/report.txt"`

## Example

* **Report file:** `/home/kareem/logs/log_analysis_report.txt`
* **Terminal warning (if threshold exceeded):**

  ```
  !!!! Action Required !!!! Too many ERROR issues in log file /home/kareem/logs/app.log
  ```

## Requirements

* Bash
* grep, find


