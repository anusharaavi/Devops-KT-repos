#!/bin/bash

# Set the threshold for CPU load percentage
threshold=80

# Get the current CPU load percentage
cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Check if CPU load exceeds the threshold
if (( $(echo "$cpu_load > $threshold" | bc -l) )); then
    	 aws sns publish --topic-arn "arn:aws:sns:ap-south-1:805724738913:disk_usage" --message "CPU- Load alert: $cpu_load is crossing $threshold usage"

fi

