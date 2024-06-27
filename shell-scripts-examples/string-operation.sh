#!/bin/bash

myv="hee de"

myvc=${#myv}

echo "my vale is ${#myv}"
echo "my $myvc"


echo "upper case ${myv^^}"

echo "low case ${myv,,}"


## to replace a string #######

newV=${myv/hee/desk}


echo "can $newV"



##### slicing #######33


echo "echo ${myv:4:5}"
