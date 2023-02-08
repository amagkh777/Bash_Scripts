#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=($1)




#for var in ${NUM[@]}
#do
#echo $var

#if [ "$var" = "оформить" ]
#   then
	   #echo "step 1"
            #echo -n "Вы хотите купить цемент?"
            #exit 0
	    for var in ${NUM[@]}
		do
			#a=${#var}
			#echo $a
			#if [ "$a" -lt "3" ];then
			#continue
			#fi
			a=${var:0:1}
			a=${a^^}
			var=${a}${var:1}
			#echo "step 2"
			#echo ${NUM[@]}
		#if [ "$var" = "договор" ]
		#   then
           	#echo -n "Вы хотите оформить договор?"
            	#exit 0
   		#fi
		#echo ${var^^}

		b=`grep -w "$var" /usr/share/asterisk/agi-bin/table|awk '{ print $4 }'| head -1`
		echo -n "$b"|sed 'y/_/ /'
		if [ -n "$b" ]; then
		exit 0
		fi
		done

#   fi



#if [ "$var" = "цемент" ]
#   then
#	    echo -n "Вы хотите купить цемент?"
#            exit 0
#   fi

#done
