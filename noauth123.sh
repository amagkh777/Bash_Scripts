#!/bin/bash
cd /var/www/html/phone/
echo -n  > noauth1
#go=(`asterisk -rx "sip show registry"|grep "No Authentication\|Request"|awk '{print ""$3""}'`)

go=(`/usr/sbin/asterisk -rx "sip show registry"|grep -v '\(Username\|registrations.\)'|awk '{print ""$3""}'`)
echo ${go[@]}
for n in "${go[@]}"; do

if [ "${#n}" = 12 ]
then
if [ "$n" = "8443556600@b" ]; then
	echo ${n::-2} >> noauth1
	continue
else
        if [ "$n" = "883140776450" ]; then
        echo ${n} >> noauth1
	continue
fi
fi
	
	echo ${n::-1} >> noauth1
else
	echo ${n} >> noauth1
fi


done

