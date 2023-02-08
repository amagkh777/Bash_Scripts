#!/bin/bash
#sleep 5
#echo -n > putinme.txt

#num=$1
number="464616 Bx."
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
   dt1=$(date --date="-120 min" +"%Y-%m-%d %H:%M")
   dt2=$(date +"%Y-%m-%d %H:%M")	
echo $dt1
echo $dt2
#echo $number
#where calldate > '$dt1%' and calldate < '$dt2'
#arraysrc=()
uniq=(`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select calldate, dst from cdr where calldate >= curdate() and src like '30%' and number like '%0746 u%' and disposition like 'NO ANSWER' and duration like '0'"`)
#uniq=(`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct uniqueid from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and number like '$number%'"`)

#src=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct src from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and number like '$number%'"`

echo ${uniq[@]}

echo -n > 040420


exit 0
for un in ${uniq[@]}
do
	echo $un
	/var/lib/asterisk/kod-goroda/kod0404.sh ${un:1}
echo $un >> 040420
done


exit 0

a=`echo -n ${#uniq[@]}`

if [ "$a" -eq 0 ]
       then
               exit 0
       fi


i=$(($a-1))

echo $i
b=0


while [ "$b" -le "$i" ]
do
for un in ${uniq[$b]}
do

#	if [ "$b" -gt "$i" ]
#	then
#		exit 0
#	fi
echo "$b"
echo "$i"
result=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select disposition from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and uniqueid like '$un' and number like '$number%'"`
        result3=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select lastapp from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and uniqueid like '$un' and number like '$number%'"`
	
	s1=$( echo "$result" | grep -c "ANSWERED" )
s2=$( echo "$result3" | grep -c "BackGround" )
echo "$s1 answer"
echo "$s2 Background"

if [ "$s1" = 0 -o "$s2" = 1 ]
   then

	echo $result
	echo $result3

result1=`mysql -u noans --password="$password" --database=asteriskcdrdb --skip-column-names --batch --execute="select distinct src from cdr where calldate >= '$dt1%' and calldate < '$dt2%' and number like '$number%' and uniqueid like '$un'"`
echo $result1 
arraysrc+=([$b]=$result1)
b=$[$b+1]
#exit 0
#if [ -n "$result1" ]; then
#	 /var/lib/asterisk/noanswercont.sh "$result1" "$number"
echo "dalshe"
echo ${arraysrc[@]}
echo ${#arraysrc[@]}

#exit 0
#	 echo $result1 >> putinme.txt
else
b=$[$b+1]
echo "$un $dt1" >> put.txt	
#b=$[$b+1]       echo "net nichego"	
 fi

#fi
done
done
sorted=($(echo "${arraysrc[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
echo ${sorted[@]}
numbers=`echo ${sorted[@]}`
/var/lib/asterisk/noanswercont.sh "$numbers" "$number"

exit 0

