#!/bin/bash

echo "enter the choice"
echo "a"
echo "b"


read -p "chosse now" a

case $a in
	a)
		echo "hello"
		echo $(date)
		;;
	b)
		echo "get me"
		echo $(uname -r)
		;;
	*)
		echo "nothing"
esac

