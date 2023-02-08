#!/bin/bash
while read VAR1; do
	RESULT=$(echo "select uniqueid from cdr where (number like '$VAR1 B%' or number like '$VAR1 u%') and (calldate like '2019-12%' or calldate like '2020-01%') LIMIT 1" | mysql -uroot -pBsmth333 -N asteriskcdrdb)
#sleep 5
if [ -z "$RESULT" ]; then
  #echo $VAR1
grep -n $VAR1 list
fi
done < list




exit 0
