#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
FILE=1.csv   #имя файла
NUM=$1       # номер, переданный скрипту в 10-значном формате
VARIABLE=${NUM:0:1}
if [ "$VARIABLE" = "+" ]; then
NUM=${NUM:2:10}
fi


if  [ $VARIABLE -eq 7 ] || [ $VARIABLE -eq 8 ]
then
NUM=${NUM:1:10}
fi

echo $VARIABLE
echo $NUM

exit 0
PREF=${NUM:0:3} #код
MID=${NUM:3:11} # сам номер
lines="$( cat $DIR/$FILE | grep ^$PREF )"   # получаем из файла все вхождения по коду города. Все строки
#слепляются тут в одну очень длинную строку, именно поэтому и нужно было избавиться от пробелов, которые теперь будут отделять записи друг от друга

for str in $lines; #цикл по всем вхождениям
do

start=$( echo $str | cut -d '!' -f2 )   #получаем начальный и конечный номера диапазона
stop=$( echo $str | cut -d '!' -f3 )

if [ "$MID" -le "$stop" ]&&[ "$MID" -ge  "$start" ] #если наш номер входит в диапазон
then
reg1=$( echo $str | cut -d '!' -f6 )    #получаем название региона
reg2=$( echo $str | cut -d '!' -f5 )
reg="$reg1"
break  #выходим из цикла
fi

done
if [ -z $reg ];then
reg="Россия"
fi
echo $reg # и выводим результат
exit 0
