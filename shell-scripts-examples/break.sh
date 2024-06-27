n=4

for k in {1..9}
do
	if [[ $n -eq $k ]]
	then
		echo "$n is found"
		break
	fi
	echo "nothing is $k"
done
