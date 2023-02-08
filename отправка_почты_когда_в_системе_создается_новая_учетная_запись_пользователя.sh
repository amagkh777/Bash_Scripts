#!/bin/bash

#Set the variable which equal to zero
prev_count=0

count=$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/secure | egrep -wi 'useradd' | wc -l)

if [ "$prev_count" -lt "$count" ] ; then

# Send a mail to given email id when errors found in log

SUBJECT="ATTENTION: New User Account is created on server : `date --date='yesterday' '+%b %e'`"

# This is a temp file, which is created to store the email message.

MESSAGE="/tmp/new-user-logs.txt"

TO="admin@itsecforu.ru"

echo  "Hostname: `hostname`" >> $MESSAGE

echo -e "\n" >> $MESSAGE

echo "The New User Details are below." >> $MESSAGE

echo "+------------------------------+" >> $MESSAGE

grep -i "`date --date='yesterday' '+%b %e'`" /var/log/secure | egrep -wi 'useradd' | grep -v 'failed adding'| awk '{print $4,$8}' | uniq | sed 's/,/ /' >>  $MESSAGE

echo "+------------------------------+" >> $MESSAGE

rm $MESSAGE

mail -s "$SUBJECT" "$TO" < $MESSAGE

fi
