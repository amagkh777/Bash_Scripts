#!/usr/local/bin/bash

FILE="/var/log/apache/site.ua-error.log"
FAILF=`cat $FILE | grep -i "authentication failure"`
FAILN=`cat $FILE | grep -i "user.*not found"`
SUBJECT="Last auth failures for site"
EMAIL="mail@domain.com"
EMAILMESSAGE="/tmp/auth_errors.txt"

echo "" > /tmp/auth_errors.txt

echo "$FAILF" > /tmp/auth_errors.txt
echo "$FAILN" >> /tmp/auth_errors.txt

# проверяем не являются ли обе переменные пустыми, иначе  нечего будет отправлять
if [ -n "$FAILN" -o "$FAILF" ]
then
mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
fi
