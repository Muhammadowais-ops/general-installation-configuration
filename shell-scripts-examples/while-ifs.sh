#!/bin/bash

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
