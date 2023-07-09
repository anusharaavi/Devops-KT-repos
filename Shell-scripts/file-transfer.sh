#!/bin/bash


echo "provide file name to transfer " 
read source_file
echo "provide destination dir"
read destination
echo "give destination host details as user@destination_server"
read path

scp -i /home/ec2-user/Devops-KT-repos/Shell-scripts/pw.pem $source_file $path:$destination

if [ $? -eq 0 ]
then 
	echo "File transferred successfully."
else
	echo "file transfer not successful"
fi

