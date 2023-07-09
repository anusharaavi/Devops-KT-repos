#!/bin/bash

# Get the current date and subtract 30 days
start_date=$(date -d "30 days ago" +%Y-%m-%d)

# Use the 'last' command to retrieve login information
logins=$(last --since "$start_date")

# Extract the usernames from the login information
users=$(echo "$logins" | awk '!/^$/ && !/reboot/ {print $1}' | sort -u)

# Output the usernames
echo "Users who logged in the last 30 days:"
echo "$users"

