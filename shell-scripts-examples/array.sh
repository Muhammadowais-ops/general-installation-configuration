#!/bin/bash

myarray=(1 2 15 "he" "be" 1.4 )

echo "to check all the values in array ${myarray[*]}"

echo "to check specific index values ${myarray[1]}"

echo "index is ${myarray[2]}"

echo "new ${#myarray[*]}"


echo "new testing values ${myarray[*]:1:2}"


myarray+=( 11 20 )

echo "all values ${myarray[*]}"
