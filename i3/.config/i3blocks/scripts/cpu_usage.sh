#!/bin/bash

# Get CPU usage
cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Add a leading zero if the CPU usage is less than 10
if (( $(bc <<< "$cpu_usage < 10") )); then
    cpu_usage="0$cpu_usage"
fi

# Format the output in the desired i3blocks format
echo "$cpu_usage%"
