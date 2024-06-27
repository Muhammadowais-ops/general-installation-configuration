#!/bin/bash

echo "---- Monitoring Metrics Script ----"
echo "1. View System Metrics"
echo "2. Monitor a Specific Service"
echo "3. Exit"


read -p "enter the value from given options " va

if [[ $va == 0 ]] || [[ $va -gt 3 ]] || [[ -z $va ]]
then
	echo "giving wrong or empty value"
	exit 1
fi



case $va in
	1)
		echo "view system metrics"
		trap "echo The script is terminated; exit" SIGINT
		for (( ;; ))
		do
			echo -n $k
			free -h
			df -hT
			sleep 2
		done

		;;
	2)
		echo "monitor specific service"
		for k in 1
		do
			read -p "enter service name" nn
			echo -n $k
			systemctl status $nn
		done
		;;
	3)
		echo "exit"
		exit 1
		;;
	*)
		echo "you have not choose any value"
		;;
esac


