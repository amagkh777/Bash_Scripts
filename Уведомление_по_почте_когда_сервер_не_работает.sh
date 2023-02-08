#!/bin/bash

for i in $@
do
ping -c 1 $i &> /dev/null

if [ $? -ne 0 ]; then
	echo "`date`: ping не прошел, $i хост лежит !" | mail -s "$i хост лежит!" admin@itsecforu.ru
fi
done
