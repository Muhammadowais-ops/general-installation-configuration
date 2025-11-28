#!/bin/bash

printf '%q\n' "$IFS".  ---> %q display what its value in shell be 


while IFS="," read a v c
do
	echo $a
	echo $v
	echo $c
done < file.csv


while IFS="," read id name age
do
	echo $id
done < file.csv



cat file.csv | awk 'NR!=1 {print}' | while IFS="," read id name age 
do
	echo $id $age
done




text="apple,banana,orange"
IFS=',' read -r a b c <<< "$text"           # why put <<< this because read use stdin pipe to read not string

echo "$a $b $c"

csv="red,green,blue"

for color in $csv; do
    echo "$color"
done

while IFS="," read -r col1 col2 col3; do
    echo "col1=$col1"
    echo "col2=$col2"
    echo "col3=$col3"
done < new.txt

VARM="ABCDE,DEF"                                   # in below you can see we are prevserving old value of IFS 
CMD="ls -ltrh"									
if [[ -n "$VARM" ]]; then
    OLDIFS=$IFS
    IFS=,
    for k in $VARM; do
        echo "$k"
	eval $CMD											# what is eval basically eval will run variables as command whatever you put be careful
    done
    IFS=$OLDIFS
fi
