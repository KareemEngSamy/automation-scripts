#!/bin/bash

# Configuration
# Replace with the desired path and email address
REPORT_FILE="/tmp/system_report.txt"
EMAIL_ADDRESS="kareem@gmail.com" #

# Initialize Report
write_header() {
    echo "System Resource Report - $(date)" > "$REPORT_FILE"
    echo "------------------------------" >> "$REPORT_FILE"
}

# Collect Disk Usage
report_disk() {
    echo "Disk Usage:" >> "$REPORT_FILE"
    df -h >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Collect Memory Usage
report_memory() {
    echo "Memory Usage:" >> "$REPORT_FILE"
    free -h >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Collect CPU Usage
report_cpu() {
    echo "CPU Usage:" >> "$REPORT_FILE"
    # -b runs top in batch mode (better for scripts)
    top -bn1 | grep "Cpu(s)" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

# Send Email
send_report() {
    if command -v mail >/dev/null 2>&1; then
        mail -s "System Resource Report" "$EMAIL_ADDRESS" < "$REPORT_FILE"
        echo "Report emailed to $EMAIL_ADDRESS"
    else
        echo "Error: 'mail' command not found. Please install mailutils/postfix."
    fi
}

# Cleanup
cleanup() {
    if [ -f "$REPORT_FILE" ]; then
        rm "$REPORT_FILE"
        echo "Temporary file cleaned up."
    fi
}

# Main Execution Flow
main() {
    write_header
    report_disk
    report_memory
    report_cpu
    send_report
    cleanup
}

main