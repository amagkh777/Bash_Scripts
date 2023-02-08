#!/bin/bash
CON="telnet somehost.com 8080"
FILE="/tmp/db_con_test.log"
SUBJ="Connection lost"
TEXT="Server notify: connection to somehost lost. Re-auth it, please."
TO="user@mail.com"
STR1=`cat /tmp/db_con_test.log | grep Connected | cut -d' ' -f 1`
STR2="Connected"
LOC="/var/lock/db_con.loc"
export "smtp=smtp.otherhost.com:25"

# проверяем наличие файла, если есть - пишем в него лог подключения
if [ -e $FILE ]
then
$CON > $FILE 2> /dev/null
else
echo "No file!"
fi

# Сравниваем переменные, если совпали (Connected = Connected) - удаляем файл блокировки и выходим
if [ "$STR1" = "$STR2" ]
then
if [ -e $LOC ]
then
rm -r $LOC
fi
echo "Connection OK"
exit 0

# если слова Connected нет - проверяем наличие файла блокировки. Если есть - ничего не отправляем, завершаем скрипт.
else
if [ -e $LOC ]
then
exit 1

# Если файла блокировки нет - отправляем письмо с текущей датой и создаём файл блокировки
else
echo $(date) $TEXT | mailx -s $SUBJ $TO | touch /var/lock/db_con.loc
fi
fi
