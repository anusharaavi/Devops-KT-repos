#!/bin/bash

# Set the threshold for free RAM percentage
threshold=20

# Get the available free RAM percentage
free_ram=$(free | awk '/^Mem/ { printf("%.2f"), $4/$2 * 100 }')

# Check if free RAM is below the threshold
if (( $(echo "$free_ram < $threshold" | bc -l) )); then
    # Define email parameters

    aws sns publish --topic-arn "arn:aws:sns:ap-south-1:805724738913:disk_usage" --message "free ram is below $threshold%. Current Free RAM: $free_ram%"
fi

