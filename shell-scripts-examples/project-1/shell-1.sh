#!/bin/bash


pth=/root/sql/
tarf=tar-gz-folder

if [[ ! -d $pth/$tarf ]]
then
	mkdir -p $pth/$tarf
fi


for k in $(find $pth -name *.sql)
do
	a=$(basename $k)
	
	if [[ $? -eq 0 ]]
	then
		cd $pth
		tar -czvf $a.tar.gz $a
		rm -rf $a && mv $a.tar.gz $pth/$tarf || exit 1
	fi
	echo "all action done"
done
