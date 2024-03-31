#!/bin/bash

LOG_FILE="/var/log/auth.log"

analyze_log() {
    echo "Analyzing log file $LOG_FILE ..."
    successful_attempts=$(grep "Accepted" $LOG_FILE)
    failed_attempts=$(grep "Failed" $LOG_FILE)

    echo "Successful attempts:"
    echo "$successful_attempts"

    echo "Failed attempts:"
    echo "$failed_attempts"
}

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file $LOG_FILE not found."
    exit 1
fi

analyze_log
