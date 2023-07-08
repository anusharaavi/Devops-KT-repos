#!/bin/bash


#script to check remote connectivity of 1000 systems in your infrastructure and generate alert if system is not reachable
# List of remote system IP addresses or hostnames
systems=(
    www.google.com
    172.31.37.3
    www.aws.com
   )

# Function to check remote connectivity
check_connectivity() {
    local system=$1
    local timeout=5  # Connection timeout in seconds
    local attempts=3  # Number of connection attempts

    for (( i=1; i<=$attempts; i++ )); do
        if ping -c 1 -W $timeout $system > /dev/null 2>&1; then
            echo "System $system is reachable."
           return 0 
        fi
    done

    echo "System $system is not reachable."
    # You can add additional actions here, such as sending an email or triggering a notification.
    return 1
}

# Iterate over the systems list and check connectivity for each
for system in "${systems[@]}"; do
    check_connectivity "$system"
done

