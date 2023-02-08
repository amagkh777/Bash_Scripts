#!/bin/bash
#sleep 5
#echo -n > putinme.txt
password=ansno964aA!
#num=$1
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
#   dt1=$(date --date="-120 min" +"%Y-%m-%d %H:%M")
#echo $dt1
#echo $number
#where calldate > '$dt1%' and calldate < '$dt2'
#arraysrc=()

#uniq=(`asterisk -rx "sip show peers"|grep "/60"|awk '{print ""$1""}'|grep -v '\(601/\|602/\|603/\|604/\)'`)

#src=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct src from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and number like '$number%'"`
uniq=(`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select clid from cdr where calldate >= '2020-04-18%' and calldate <= '2020-04-22 08:00%' and number like '88005557346 B%' and dcontext like 'not-work-hour%'"`)

echo ${uniq[@]}
grep1=`echo ${uniq[@]}|grep -c "Орловская"`
echo "Число $grep1"
for un in ${uniq[@]}
do
echo $un
	#/usr/sbin/asterisk -rx "sip show peer "${un:0:-5}| grep "Reg. Contact"
done

#select * from cdr where calldate >= '2020-04-18%' and calldate <= '2020-04-22 08:00%' and number like '88005557346 B%' and dcontext like 'not-work-hour%';


exit 0


