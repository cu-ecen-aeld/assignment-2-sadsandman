#!/bin/bash
finder(){
	filesdir=$1
	searchstr=$2

	if [ -z "$filesdir" ] || [ -z "$searchstr" ]
	then
		return 1
	elif [ ! -d "$filesdir" ]
	then
		return 1
	else
	
		filecount=$(find "$filesdir" -type f | wc -l)
		linecount=$(grep -ro "$searchstr" "$filesdir" | wc -l)

		echo "The number of files are $filecount and the number of matching lines are $linecount"
	fi
}
finder "$1" "$2"
