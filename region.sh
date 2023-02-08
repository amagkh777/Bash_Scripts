#!/bin/bash

#Определим переменные
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=$1

#exten => 88005557346,n,Set(__ast=${SHELL(echo "${reg}"|grep -c "Астрахан")})
#exten => 88005557346,n,Set(__asta=${SHELL(echo "${ast}"|sed 's/^\(.\).*/\1/')})
#exten => 88005557346,n,Set(__volg=${SHELL(echo "${reg}"|grep -c "Волгогр")})
#exten => 88005557346,n,Set(__lip=${SHELL(echo "${reg}"|grep -c "Липецк")})
#exten => 88005557346,n,Set(__orel=${SHELL(echo "${reg}"|grep -c "Орловск")})
#exten => 88005557346,n,Set(__magn=${SHELL(echo "${reg}"|grep -c "Челябинск")})

s1=$( echo "$NUM" | grep -c "Астрахан" )
s2=$( echo "$NUM" | grep -c "Волгогр" )
s3=$( echo "$NUM" | grep -c "Липецк" )
s4=$( echo "$NUM" | grep -c "Орловск" )
s5=$( echo "$NUM" | grep -c "Челябинск" )

w1=$( echo $s1 | sed 's/^\(.\).*/\1/' )
w2=$( echo $s2 | sed 's/^\(.\).*/\1/' )
w3=$( echo $s3 | sed 's/^\(.\).*/\1/' )
w4=$( echo $s4 | sed 's/^\(.\).*/\1/' )
w5=$( echo $s5 | sed 's/^\(.\).*/\1/' )

#echo $w1

if [ $w1 -eq 1 ];
then
        a=1
fi

if [ $w2 -eq 1 ];
then
        a=2
fi

if [ $w3 -eq 1 ];
then
        a=3
fi

if [ $w4 -eq 1 ];
then
        a=4
fi

if [ $w5 -eq 1 ];
then
        a=5
fi

echo -n $a

 