#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
PROCESS_THRESHOLD=200

# Check and display CPU usage using top
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | tr -s ' ' | cut -d ' ' -f 2)
echo "CPU Usage: $CPU_USAGE%"

if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "ALERT: High CPU usage: $CPU_USAGE%"
fi

# Check and display Memory usage using free
MEMORY_USED=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 3)
MEMORY_TOTAL=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 2)
MEMORY_USAGE=$(echo "scale=2; ($MEMORY_USED/$MEMORY_TOTAL)*100" | bc)
echo "Memory Usage: $MEMORY_USAGE%"

if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "ALERT: High memory usage: $MEMORY_USAGE%"
fi

# Check and display Disk space usage using df
DISK_USAGE=$(df / | grep / | tr -s ' ' | cut -d ' ' -f 5 | sed 's/%//g')
echo "Disk Usage: $DISK_USAGE%"

if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "ALERT: High disk usage: $DISK_USAGE%"
fi

# Check and display number of running processes
RUNNING_PROCESSES=$(ps aux | wc -l)
echo "Running Processes: $RUNNING_PROCESSES"

if [ $RUNNING_PROCESSES -gt $PROCESS_THRESHOLD ]; then
    echo "ALERT: High number of processes: $RUNNING_PROCESSES"
fi

