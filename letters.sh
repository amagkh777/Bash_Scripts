#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=($1)




	    for var in ${NUM[@]}
		do
			a=${var:0:1}
			a=${a^^}
			var=${a}${var:1}

		b=`grep -w "$var" /usr/share/asterisk/agi-bin/table|awk '{ print $4 }'| head -1`
		#if [ "$var" = "Нужен" -o "$var" = "Нужна" -o "$var" = "Есть" -o "$var" = "Нужно" -o "$var" = "Сколько" ];then
		case $var in

   		Нужен|Нужна|Есть|Нужно|Сколько|Наличию|Наличие|Наличии)
           		b=""
                        i=1 
	   		;;

		esac

		if [ -n "$b" ]; then
		i=2
		break
		fi
		done
			if [ $i -eq 1 ]; then
			NUM=($1)
			for var in ${NUM[@]}
				do
					a=${var:0:1}
                        		a=${a^^}
                        		var=${a}${var:1}
					b=`grep -w "$var" /usr/share/asterisk/agi-bin/table|awk '{ print $4 }'| head -1`
					echo -n "$b"
					if [ -n "$b" ]; then
						exit 0
					fi
				done
			fi
echo -n "$b"
exit 0
