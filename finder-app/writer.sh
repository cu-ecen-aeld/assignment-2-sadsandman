#!/bin/bash

writefile=$1
writestr=$2
Directory=$(dirname "$writefile")

if [ -z "$writefile" ] || [ -z "$writestr" ] 
then
	exit 1
elif ! mkdir -p "$Directory";
then 
	exit 1
else
	echo "$writestr">"$writefile"
	
fi
