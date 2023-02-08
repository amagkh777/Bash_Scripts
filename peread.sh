#!/bin/bash
echo -n > peread
while read line; do




search=`/usr/sbin/asterisk -rx "dialplan show in-$line"|grep -c "Dial"` 

if [ "$search" -gt "0"  ]; then
echo $line >> peread
/usr/sbin/asterisk -rx "dialplan show in-$line"|grep Dial >> peread


fi





done < /var/www/html/phone/noauth1
