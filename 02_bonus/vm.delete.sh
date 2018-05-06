#!/bin/bash
echo "Please enter the name of the virtual machine to be deleted"
name=""
while [ -z "$name" ]
do
	read -r name
done
docker-machine rm -y $name
