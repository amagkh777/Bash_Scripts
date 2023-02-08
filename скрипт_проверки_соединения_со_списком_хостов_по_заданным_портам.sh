#!/bin/bash
# задаём путь к временному файлу, в который будем писать результат выполнения проверки
FILE="/tmp/db_hosts_con_test.log"

rm -rf $FILE
touch $FILE

# указываем файл со списком хостов и портов, запускаем цикл в который сразу "скармливаем" три переменных для проверки
cat /home/setevoy/scripts/db_hosts.txt |  while read NAME HOST PORT
do

# для красоты вывода результата - сначала вписываем имя проверяемого хоста
printf "%stt" $NAME >> $FILE &&

# записываем результат проверки хост:порт
printf "%st%sn" `nmap -Pn -p $PORT $HOST

# выделяем только 6 строку результата проверки и только 1 и 2 поля
| head -n 6 | tail -n 1 | cut -d' ' -f 1,2

# вырезаем лишнее - слово "tcp" и меняем "filtered" на "closed", дописываем в файл результат
| sed -e '{s/.tcp//;}' -e 's/filtered/closed/g'` >> $FILE

done

# выводим на консоль сам результат
cat $FILE


domain.com 127.0.0.1 22

