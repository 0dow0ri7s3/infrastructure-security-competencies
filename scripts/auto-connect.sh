#!/bin/bash
# auto-connect.sh - Automated SSH connection helper
LEVEL=$1
if [ -z "$LEVEL" ]; then
    echo "Usage: ./auto-connect.sh <level_number>"
    exit 1
fi
ssh bandit$LEVEL@bandit.labs.overthewire.org -p 2220
