#!/bin/bash

if [ $# -eq 0 ]
then
echo "Please do not enter Zero"
echo "Syntax : $0 number"
exit 1
fi
n=$1
for i in 1 2 3 4 5 6 7 8 9 10
do
echo "$n * $i = `expr $i \* $n`"
done


