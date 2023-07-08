#!/bin/bash

# Run systemctl command to list active services
services=$(systemctl list-units --type=service --state=running --no-pager --no-legend | awk '{print $1}')

# Iterate over the list of services
for service in $services; do
    echo "$service"
done

