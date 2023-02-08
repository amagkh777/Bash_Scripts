#!/usr/local/bin/bash
FREE=`df -h | grep da0p3 | awk '{print $4}' | sed '{s/.$//;}'`
MIN=1000
TO="email@domain.com"
SBJ="Alarm - free space"

echo $FREE

if [ $FREE -lt $MIN ]
	then
		echo $FREE | mail -s $SBJ $TO
		echo "Huston, we have a problem!"
	else
		echo "Good!"
fi
