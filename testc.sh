#!/bin/bash
#cd /var/www/html/phone/

telefon=89171936279
callfile=/tmp/$telefon.call
rm -Rf $callfile

#Create call file
touch $callfile
echo "Channel: SIP/464616-out/$telefon" >> $callfile
#echo "Channel: Local/s@outdolg" >> $callfile
echo "Set: abon=$telefon" >> $callfile
#echo "MaxRetries: 8" >> $callfile
#echo "RetryTime: 5" >> $callfile
echo "Context: voice" >> $callfile
echo "Extension: s" >> $callfile
echo "Priority: 1" >> $callfile
echo "Set: var=123456" >> $callfile

#Move call file to asterisk directory
mv $callfile /var/spool/asterisk/outgoing/




exit 0
