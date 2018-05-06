#!/bin/bash
echo "Please enter a name for your new virtual machine"
name=""
while [ -z "$name" ]
do
	read -r name
done
docker-machine create -d virtualbox $name
eval "$(docker-machine env $name)"