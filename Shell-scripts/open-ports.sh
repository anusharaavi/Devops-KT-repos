#!/bin/bash

# Get open ports and their corresponding names
open_ports=$(netstat -tuln | awk 'NR>2 {print $4}')
	
# Print open ports and their names
echo "Open ports:"
echo "----------------"
for port in $open_ports; do
    port_number=$(echo "$port" | awk -F':' '{print $NF}')
    echo "Port $port_number"
done

