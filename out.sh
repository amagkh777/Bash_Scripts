#!/bin/bash
cd /var/www/html/phone/
echo -n > out
password=ansno964aA!

   dt1=$(date +"%Y-%m-%d")
echo $dt1

aster=`/usr/sbin/asterisk -rx "sip show registry"|grep -c -v '\(Registered\|Username\|registrations.\)'`

if [ "$aster" -gt 0 ]
	then
echo est
		/usr/sbin/asterisk -rx "sip reload"
	fi



number="88005557346 266777 222777 Kazakhstan 9379000000 9272828650 556600 9272821729 9205048347 506060 9205010746 9300632457 9300632456 9227593232 9227593636 9272828660 9272828657 9272821783 9272828664 9272828663 9205010889 9272828714"



#while [ "$b" -le "$i" ]
#do
for num in ${number[@]}
do

#echo "$b"
#echo "$i"
if [ "$num" = "Kazakhstan" ]
then
	count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate >= '$dt1 7:00%' and calldate <= '$dt1 23:00%' and number like '%$num%'"`

echo $count >> out
continue
fi
count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate >= '$dt1 7:00%' and calldate <= '$dt1 23:00%' and number like '%$num u%'"`

echo $count >> out
done
#done

