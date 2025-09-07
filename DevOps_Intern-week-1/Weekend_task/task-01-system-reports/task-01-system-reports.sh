#!/bin/bash

{
 echo "===== System Report ====="
 echo "Hostname: $(hostname)"
 echo "User: $(whoami)"
 echo "Date: $(date)"
 echo "Uptime: $(uptime -p)"
 echo "Disk Usage:"
 df -h
} > system_report.txt

echo "System report generated!"
