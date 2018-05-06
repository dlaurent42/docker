#!/bin/bash
echo "Please enter the name of the container to be deleted"
name=""
while [ -z "$name" ]
do
	read -r name
done
docker rm -f $name
