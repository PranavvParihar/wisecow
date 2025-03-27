#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90
PROCESS_THRESHOLD=200

# Check CPU usage using top
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | tr -s ' ' | cut -d ' ' -f 2)
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "$(date): ALERT - High CPU usage: $CPU_USAGE%" >> /var/log/system_health.log
    echo "ALERT: High CPU usage: $CPU_USAGE%"
fi

# Check Memory usage using free
MEMORY_USED=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 3)
MEMORY_TOTAL=$(free | grep Mem | tr -s ' ' | cut -d ' ' -f 2)
MEMORY_USAGE=$(echo "scale=2; ($MEMORY_USED/$MEMORY_TOTAL)*100" | bc)

if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "$(date): ALERT - High memory usage: $MEMORY_USAGE%" >> /var/log/system_health.log
    echo "ALERT: High memory usage: $MEMORY_USAGE%"
fi

# Check Disk space usage using df
DISK_USAGE=$(df / | grep / | tr -s ' ' | cut -d ' ' -f 5 | sed 's/%//g')
if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
    echo "$(date): ALERT - High disk usage: $DISK_USAGE%" >> /var/log/system_health.log
    echo "ALERT: High disk usage: $DISK_USAGE%"
fi

# Check number of running processes
RUNNING_PROCESSES=$(ps aux | wc -l)
if [ $RUNNING_PROCESSES -gt $PROCESS_THRESHOLD ]; then
    echo "$(date): ALERT - High number of processes: $RUNNING_PROCESSES" >> /var/log/system_health.log
    echo "ALERT: High number of processes: $RUNNING_PROCESSES"
fi

