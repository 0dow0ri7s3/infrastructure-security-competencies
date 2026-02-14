#!/bin/bash
# log-analyzer.sh - Extract and analyze command outputs
LEVEL=$1
LOG_DIR="notes"
LOGFILE="$LOG_DIR/key-learnings.md"
if [ -z "$LEVEL" ]; then
    echo "Usage: ./log-analyzer.sh <module_number>"
    exit 1
fi
echo "=== Module $LEVEL Analysis - $(date) ===" >> $LOGFILE
echo "Commands executed recently:" >> $LOGFILE
history 10 >> $LOGFILE
echo "" >> $LOGFILE
