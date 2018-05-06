#!/bin/bash

cmd="docker run"

echo "Please enter the type of container (ex:debian)"
container=""
while [ -z "$container" ]
do
	read -r container
done

echo "Please enter a name for your new container"
name=""
while [ -z "$name" ]
do
	read -r name
done

echo "Please enter a link for your new container (press enter to skip)"
link=""
read -r link

echo "Please enter ports for your new container (ex:8080:80 or press enter to skip)"
port=""
read -r port

echo "Do you want to detach your container (y/n)"
detach=""
read -r detach

echo "Do you want to make your container interactive (y/n)"
interactive=""
read -r interactive

echo "Do you want to delete your container after use (y/n)"
del=""
read -r del

cmd="$cmd --name $name"

if [ ! -z "$link" ]
then
	cmd="$cmd --link $link"
fi

if [ ! -z "$port" ]
then
	cmd="$cmd -p $port"
fi

if [ $detach = "y" ]
then
	cmd="$cmd -d"
fi

if [ $interactive = "y" ]
then
	cmd="$cmd -it"
fi

if [ $del = "y" ]
then
	cmd="$cmd --rm"
fi

cmd="$cmd $container"

$cmd

echo "command run : $cmd"
