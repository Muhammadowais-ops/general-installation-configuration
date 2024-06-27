#!/bin/bash

if [[ $UID -ne 0 ]]
then
	echo "you need to be root to run script"
	exit 1
fi


echo "Usage: ${0} [OPTIONS]"

echo "Options:"
echo -e "  -c,  --create\tCreate a new user account"
echo -e "  -d,  --delete\tDelete an exisiting user account"
echo -e	"  -r.  --reset\tReset password for an exisiting user account"
echo -e	"  -l,  --list\tList all user accounts on the system"
echo -e	"  -h,  --help\tDisplay this help and exit"



k=$1


case $k in
	--create|-c)
		echo "creating user"
		read -p "provide username: " username
		if [[ $username == $(awk -F: '{ print $1 }' /etc/passwd|grep $username) ]]
		then
			echo	"user already exit"
			exit 1
		fi
		read -s -p "enter passwd: " ped
		adduser -m -s /bin/bash $username
		echo -n $ped | passwd --stdin $username
		usermod -aG wheel $username

		;;
	--delete|-d)
		echo "deleting user"
		read -p "provide username " username
		userdel -r $username
		;;
	--reset|-r)
		echo "reseting user password"
		read -p "provide username password to reset " username
		read -s -p "provide password to reset " reset
		echo -n $reset | passwd --stdin $username
		;;
	--list|-l)
		echo "list all the system users"
		awk -F: '{ print $1 }' /etc/passwd
		;;
	--help|-h)
		echo -e "\n you can write like bash script-name -h"
		echo " provide values like create delete or other to perform those actions"
		;;
		*)
		echo "you have not provided any value"
		;;
esac

