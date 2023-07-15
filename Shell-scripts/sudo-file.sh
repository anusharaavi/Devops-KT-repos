#!/bin/bash

# Check /etc/passwd file for users with UID 0 (root)
root_users=$(awk -F: '($3 == 0) {print $1}' /etc/passwd)

# Check /etc/sudoers file for users with root privileges
sudo_users=$(grep -Po '^sudo.+:\K.*$' /etc/group | tr ',' '\n')

# Combine and print the list of root users
echo "Root Users:"
echo "-----------"
echo "$root_users" "$sudo_users" | tr ' ' '\n' | sort -u

