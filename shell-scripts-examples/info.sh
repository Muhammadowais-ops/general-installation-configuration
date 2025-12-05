#!/bin/bash


basename /root/shell-scripts/file.csv

dirname /root/shell-scripts/file.csv

realpath /root/shell-scripts/file.csv

echo $RANDOM
echo $UID


echo "the name of script ${0}"

echo "$$"

<< comment

1. -z: Checks if a string is empty.

if [ -z "$string" ]; then
    # string is empty
fi

1. -n: Checks if a string is not empty.

if [ -n "$string" ]; then
    # string is not empty
fi

1. -eq: Checks if two integers are equal.

bash
if [ $num -eq 5 ]; then
    # num is equal to 5
fi

1. -ne: Checks if two integers are not equal.

bash
if [ $num -ne 5 ]; then
    # num is not equal to 5
fi

1. -gt: Checks if one integer is greater than another.

bash
if [ $num -gt 5 ]; then
    # num is greater than 5
fi

1. -lt: Checks if one integer is less than another.

bash
if [ $num -lt 5 ]; then
    # num is less than 5
fi

1. -ge: Checks if one integer is greater than or equal to another.

bash
if [ $num -ge 5 ]; then
    # num is greater than or equal to 5
fi

1. -le: Checks if one integer is less than or equal to another.

bash
if [ $num -le 5 ]; then
    # num is less than or equal to 5
fi

1. =, ==, !=: Used for string comparison.

bash
if [ "$string" = "value" ]; then
    # string is equal to value
fi

1. -d: Checks if a directory exists.

if [ -d "$directory" ]; then
    # directory exists
fi

1. -f: Checks if a file exists.

if [ -f "$file" ]; then
    # file exists
fi

1. -x: Checks if a file is executable.

if [ -x "$file" ]; then
    # file is executable
fi

1. -w: Checks if a file is writable.

if [ -w "$file" ]; then
    # file is writable
fi

1. -r: Checks if a file is readable.

if [ -r "$file" ]; then
    # file is readable
fi


comment

if [ -s "apis_list.json" ]
-s: This is a test operator in Bash that checks whether a file exists and has a non-zero size (i.e., the file is not empty).


