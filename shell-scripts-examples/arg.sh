#!/bin/bash

set -x
if [[ $# -eq 0 ]]
then
	echo "no input"
	exit 1
fi

echo $1
echo $2
echo $@
echo $#
