#!/bin/bash
for a in $(<servers); do nmap `echo $a | sed -e 's/:/ -p /'` | grep -q "/tcp *open " || echo $a; done > /var/test/serverlist;
DATENOW=$(date +%d-%m-%Y_%T)
if (!( [ -z $(cat /var/test/serverlist) ])); then
echo $DATENOW >> /var/test/log
cat /var/test/serverlist >> /var/test/log
mail 7909*******@sms.beemail.ru < /var/test/serverlist
fi
exit

