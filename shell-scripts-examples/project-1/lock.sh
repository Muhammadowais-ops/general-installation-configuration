#!/bin/bash

# Set the lock file
lock_file=/root/shell-scripts/project-1/ne.lock

# Set up the trap to remove the lock file on exit, interrupt, or kill
trap "rm -f $lock_file" EXIT INT KILL

# Check if the lock file exists
if [[ -f $lock_file ]] 
then
	echo "Another instance of the script is already running."
  	exit 1
else
	echo "starting"
  	touch $lock_file
	sleep 5
	ls -l
  	echo "Another"
fi

