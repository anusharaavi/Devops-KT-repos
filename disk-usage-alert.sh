#!/bin/bash

thresh_hold=20
CPU_usage=$( df -h | tail -n +2 )

while IFS= read -r line; 
do
	File_system=$(echo "$line" | awk '{print $1}')
	Used_percentage=$(echo "$line" | awk '{print $5}' | tr -d '%' )
	mount_point=$(echo "$line" | awk '{print $6}')
        if [[ $Used_percentage -gt $thresh_hold ]];
	then
		
	 aws sns publish --topic-arn "arn:aws:sns:ap-south-1:805724738913:disk_usage" --message "disk usage alert: $File_system ($mount_point) is at $Used_percentage% usage"
	fi
done <<< "$CPU_usage"
