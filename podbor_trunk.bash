#!/bin/bash





oblast=`/var/lib/asterisk/kod-goroda/kod.sh ${1:1}`



grep1=`echo "$oblast" | grep -c "Астрахан"`

grep2=`echo "$oblast" | grep -c "Волгог"`

grep3=`echo "$oblast" | grep -c "Липец"`

grep4=`echo "$oblast" | grep -c "Орлов"`

grep5=`echo "$oblast" | grep -c "Челябин"`



if [ "$grep1" = "1" ];then

        miss="0"

else

        if [ "$grep2" = "1" ];then

#continue

                miss="1"

else

        if [ "$grep3" = "1" ];then

#        continue

                miss="2"

else

        if [ "$grep4" = "1" ];then

        miss="3"

else

        if [ "$grep5" = "1" ];then

        miss="4"



fi

fi

fi

fi

fi



trunks=(79272828714-out 79272821729-out 79205010746-out 79300632457-out 79227593232-out)



if [ "$miss" = "" ];then



        exit 0



fi



echo -n ${trunks[$miss]}

~
 