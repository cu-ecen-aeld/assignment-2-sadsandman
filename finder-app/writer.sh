#!/bin/bash

writefile=$1
writestr=$2
Directory=$(dirname "$writefile")

if [ -z "$writefile" ] || [ -z "$writestr" ] 
then
	exit 1
elif [ ! -z $(mkdir -p $Directory) ] || [ ! -z $(echo $writestr>$writefile) ]
then	
	exit 1
else
	$(mkdir -p $Directory)
	$(echo $writestr>$writefile)
	
fi

