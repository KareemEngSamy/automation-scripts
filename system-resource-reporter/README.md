# System Resource Reporter

## Overview
This script collects basic system metrics (Disk, Memory, and CPU usage), generates a temporary report, emails it to a specified administrator, and cleans up the temporary file automatically.

## Features
* **Modular Design:** Uses functions for distinct tasks.
* **Automated Cleanup:** Deletes the report file after sending.
* **Batch Processing:** Uses `top` in batch mode to ensure script compatibility.

## collected Data
1.  **Disk Usage:** Output from `df -h`
2.  **Memory Usage:** Output from `free -h`
3.  **CPU Usage:** Snapshot from `top`

## Requirements
* Bash shell
* `mail` utility installed and configured (e.g., `sudo apt install mailutils`)
* Write permissions for `/tmp`

## Installation & Usage

1.  **Save the script**
    Save the code above as `system_report.sh`.

2.  **Make it executable**
    ```
    chmod +x system_report.sh
    ```

3.  **Configure Email**
    Open the file and edit the `EMAIL_ADDRESS` variable:
    ```
    EMAIL_ADDRESS="your-email@example.com"
    ```

4.  **Run the script**
    ```
    ./system_report.sh
    ```