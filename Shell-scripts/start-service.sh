#!/bin/bash


#script to start a down service in system automatically
# Set the name of the service
service_name="sshd"

# Check the status of the service
status=$(systemctl is-active $service_name)

# If the service is not active, start it
if [[ $status != "active" ]]; then
    sudo systemctl start $service_name
    echo "Service $service_name started."
else
    echo "Service $service_name is already running."
fi

