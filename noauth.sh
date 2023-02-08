#!/bin/bash
cd /var/www/html/phone/
echo -n  > noauth
#go=(`asterisk -rx "sip show registry"|grep "No Authentication\|Request"|awk '{print ""$3""}'`)

go=(`/usr/sbin/asterisk -rx "sip show registry"|grep -v '\(Registered\|Username\|registrations.\)'|awk '{print ""$3""}'`)
for n in "${go[@]}"; do
    if [ "$n" = "20" ]; then
n="464616"
else
	if [ "$n" = "883140776450" ]; then    
	n="88005557346"

else
        if [ "$n" = "716663" ]; then
        n="78000803717"
else
        if [ "$n" = "76703" ]; then
        n="77122950156"
else
        if [ "$n" = "4862_599059" ]; then
        n="74862599059"

else
        if [ "$n" = "4862_599065" ]; then
        n="74862599065"
else
        if [ "$n" = "8443556600@b" ]; then
        n="78443556600"

fi
fi
fi
fi
fi
fi
fi

if [ "${#n}" = 12 ]
then
echo ${n::-1} >> noauth
else
	echo ${n} >> noauth
fi


done

