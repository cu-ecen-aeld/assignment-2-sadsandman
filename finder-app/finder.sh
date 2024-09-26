#!/bin/bash

	filesdir=$1
	searchstr=$2

	if [ -z "$filesdir" ] || [ -z "$searchstr" ]
	then
		exit 1
	elif [ ! -d "$filedir" ]
	then
		$(echo "$filesdir\n $searchstr\n")
		exit 1
	else
		filecount = $(find "$filesdir" -type f | wc -l)
		linecount = $(grep --recursive --count "$searchstr" "$filesdir")

		$(echo "The number of files are $filecount and the number of matching lines are $linecount")
			
	fi


