#!/bin/bash
cd /var/www/html/phone/
echo -n > razrez
password=ansno964aA!

   dt1=$(date +"%Y-%m")
   dt2=$(date --date='-1 month' +"%Y-%m")
   echo $dt1
   echo $dt2
#aster=`/usr/sbin/asterisk -rx "sip show registry"|grep -c -v '\(Registered\|Username\|registrations.\)'`

#if [ "$aster" -gt 0 ]
#	then
#echo est
#		/usr/sbin/asterisk -rx "sip reload"
#	fi



queue="queue-ds1-ds8-oko-astra queue-ds2-oko-volgograd queue-ds3-oko-lipeck queue-2457-contakt queue-ds6-oko-magn"


#while [ "$b" -le "$i" ]
#do
for que in $queue
do

#echo "$b"
#echo "$i"
#if [ "$num" = "Kazakhstan" ]
#then
	count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate like '$dt1%' and number like '88005557346 B%' and lastdata like '$que%' and disposition like 'ANSWERED' and dstchannel not like 'Local/contact@%'"`

echo $count >> razrez
#continue
#fi
#count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate >= '$dt1 7:00%' and calldate <= '$dt1 23:00%' and number like '%$num u%'"`

#echo $count >> out
done

for que in $queue
do

	count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate like '$dt2%' and number like '88005557346 B%' and lastdata like '$que%' and disposition like 'ANSWERED' and dstchannel not like 'Local/contact@%'"`

echo $count >> razrez

done
#done

