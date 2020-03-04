#!/bin/bash
#Choose log and time to check
while getopts s:f: option
do
case "${option}"
in
s) sleep=${OPTARG};;
f) FILE=${OPTARG};;
esac
done

if [ "$sleep" == "" ];then
        echo "Specify time to check. Ex: $0 -f /var/log/auth.log -s 2"
	exit 0
fi

if [ "$FILE" == "" ];then
        echo "Specify file to check. Ex: $0 -f /var/log/auth.log -s 2"
	exit 0
fi


trap 'sigint'  INT
sigint()
{
	echo "signal INT received, script ending"
	echo "End of logging $FILE" | ./sender.sh
	exit 0
}


echo "test script started. My PID is $$"
echo "Start logging $FILE" | ./sender.sh

while true;do
	#num of first string at begin
	str_num1=$(wc $FILE | awk '{print $1}')
	#timeout of checking
	sleep $sleep
	#num of second string after checking
	str_num2=$(wc $FILE | awk '{print $1}')
	#count of strings to send
	com_str=$(($str_num2 - $str_num1))
	#if num of files are not changed - continue 
	if [ "$str_num1" == "$str_num2" ]; then
		continue
	else
		 tail -n $com_str $FILE | ./sender.sh
	fi
done

