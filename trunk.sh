#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=$1


#d=`/bin/bash /var/lib/asterisk/kod-goroda/transfer.sh $NUM`
#if [ $d -eq 0 ];
#then
#	NUM=100500
#fi

if [ $NUM == 2100 ] || [ "$NUM" == "2200" ] ;
then
        echo -n ""
fi


case $NUM in

    2[01]1[1234]|221[56]|2[012]91|3091|3020|3001|1072|3095)
            echo -n ""
            exit 0
            ;;
    1000|104[1-9]|10[01-3][1-9]|10[5-8][01235-9]|1064|10[9][01-9]|10[78]0) 
	    echo -n "alwis/"
	    exit 0
	    ;;
    20[0-9][0-9]) 
	    echo -n "3569/" 
	    exit 0
	    ;;
    300[1-9]|30[2-9][0-9])
	    echo -n "3568/"
	    exit 0
	    ;;
    6100|6968)
            echo -n "3570/"
            exit 0
            ;;
#50[0-9][0-9])
#            echo -n "3572/"
#            exit 0
#            ;;


#   9999) echo -n "asterisk-old/" ;; 


esac






