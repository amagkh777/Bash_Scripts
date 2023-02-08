#!/bin/bash
cd /var/www/html/phone/
echo -n > missed
echo -n > missedCALL
password=ansno964aA!
#uniq=(`grep 8800 /var/www/html/phone/cdr|grep "вке"| awk '{print ""$6""}'`)

#echo ${uniq[@]}

#echo ${#uniq[@]}

#for un in ${uniq[@]}
#do
#gr=`/var/lib/asterisk/kod-goroda/kod.sh ${un:0:-1}`

#echo $gr >> missed




#done

grep "Астраханская" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL
grep "Волгоградская" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL
grep "Липецкая" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL
grep "Орловская" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL
grep "Челябинская" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL

#uniq1=(`grep 8800 /var/www/html/phone/cdr|grep "реди"| awk '{print ""$4""}'`)

#echo ${uniq1[@]}

#echo ${#uniq1[@]}

#for un1 in ${uniq1[@]}
#do
#gr1=`/var/lib/asterisk/kod-goroda/kod.sh ${un1:0:-1}`

#echo "$gr1 $un1 queue"  >> missed


#done

grep "Астраханская" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL
grep "Волгоградская" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL
grep "Липецкая" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL
grep "Орловская" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL
grep "Челябинская" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL

grep "Россия" /var/www/html/phone/cdr|grep 8800|grep -c "вке" >> missedCALL
grep "Россия" /var/www/html/phone/cdr|grep 8800|grep -c "реди" >> missedCALL

list="group%ast group%volj group%lipeck group%orel group%mgn"

for queue in $list
do
	count=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select count(distinct uniqueid) from cdr where calldate >= curdate() and number like '88005557346 Bx.' and lastdata like '$queue%' and lastdata not like '%missed%' and disposition like 'ANSWERED';"`
echo $count >> missedCALL
done
exit 0
