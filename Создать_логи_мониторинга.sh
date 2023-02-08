#!/bin/bash 
 
LOG=/tmp/mylog.log 
SECONDS=3600 

EMAIL=admin@itsecforu.ru
 
for i in $@; do 
	echo "$i-UP!" > $LOG.$i 

done 
 
while true; do 
	for i in $@; do 

ping -c 1 $i > /dev/null 
if [ $? -ne 0 ]; then 
	STATUS=$(cat $LOG.$i) 
 		if [ $STATUS != "$i-DOWN!" ]; then 
 			echo "`date`: ping неудачен, $i хост лежит!" | 
			mail -s "$i хост лежит!" $EMAIL 

 		fi 
	echo "$i-DOWN!" > $LOG.$i 

else 
	STATUS=$(cat $LOG.$i)
 		if [ $STATUS != "$i-UP!" ]; then 
 			echo "`date`: пинг прошел, $i Хост подня!" | 
			mail -s "$i Хост поднят !" $EMAIL

 		fi 
	echo "$i-UP!" > $LOG.$i 
fi 
done 

sleep $SECONDS 
done
