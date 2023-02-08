#!/bin/bash
#sleep 5
echo -n > putinme.txt

#num=$1
number=$1
password=ansno964aA!
#mysql -sse "select uniqueid from cdr where calldate >= CURDATE() and src like '$num' and number like '464616 Bx.' ORDER BY "calldate" DESC LIMIT 1" -h 127.0.0.1 -unoans -p"$password" asteriskcdrdb | while read i
 #  do
#	   if [ "$i" -le 1 ]
 #  then
  # echo "xyu"
   #else
  # s1=$( echo "$i" | grep -c "." )
	   #echo $i
   #fi

   #done

   #echo -n "$s1"
   dt1=$(date --date="-5 hour" +"%Y-%m-%d %H:%M")
   dt2=$(date +"%Y-%m-%d %H:%M")	
#echo $dt1
#echo $dt2
#echo $number
#where calldate > '$dt1%' and calldate < '$dt2'

res=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct uniqueid from cdr where calldate > '$dt1%' and calldate < '$dt2' and number like '$number%'"`

#echo $res
for disp in $res
do
	result=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select disposition from cdr where calldate > '$dt1%' and calldate < '$dt2' and uniqueid like '$disp' and dstchannel > '0' and number like '$number%'"`
s1=$( echo "$result" | grep -c "ANSWERED" )
if [ "$s1" -eq 0 ]
   then

#	echo $result
result1=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct src from cdr where calldate > '$dt1%' and calldate < '$dt2' and uniqueid like '$disp' and dstchannel > '0' and number like '$number%'"`
 if [ -n "$result1" ]; then
	 echo $result1 >> putinme.txt
 fi

fi
done


exit 0
   res=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select uniqueid from cdr where calldate >= CURDATE() and src like '$num' and number like '$number%' ORDER BY "calldate" DESC LIMIT 1"`
 #  echo $res
   result=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select disposition from cdr where calldate >= CURDATE() and src like '$num' and uniqueid like '$res' and dstchannel > '0' and number like '$number%'"`
#echo "$result"
   s1=$( echo "$result" | grep -c "ANSWERED" )
 #  echo "$s1"
   if [ "$s1" -eq 1 ]
   then
#	   echo "da"
	   exit 0
   else
#	   echo "net"
	   sleep 300
	   res1=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select uniqueid from cdr where calldate >= CURDATE() and src like '$num' and number like '$number%' ORDER BY "calldate" DESC LIMIT 1"`
	   check=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select disposition from cdr where calldate > '$dt1%' and calldate < '$dt2' and src like '$num' and uniqueid like '$res1' and dstchannel > '0' and number like '$number%'"`
#	echo "$check"
	   s2=$( echo "$check" | grep -c "ANSWERED" )
#	echo "$s2"
	if [ "$s2" -eq 1 ]
   then
 #          echo "da"
           exit 0
   else
  #         echo "net"
	   telefon=89171936279
callfile=/tmp/$telefon.call
rm -Rf $callfile

#Create call file
touch $callfile
echo "Channel: Local/docall@operatorspool1" >> $callfile
echo "Callerid: "Пропущенный звонок от клиента" <$telefon>" >> $callfile
echo "MaxRetries: 10" >> $callfile[/font]
echo "RetryTime: 20" >> $callfile
echo "WaitTime: 300" >> $callfile
echo "Context: bnumleg" >> $callfile
echo "Extension: docall" >> $callfile
echo "Priority: 1" >> $callfile
echo "Set: BNUM=$telefon" >> $callfile

#Move call file to asterisk directory
mv $callfile /var/spool/asterisk/outgoing/

exit 0

   fi
   fi

