#!/bin/bash 

str="Меня зовут AndreyEX" 
IFS=' '
read -a strarr <<< "$str" 
echo "В строке ${#strarr[*]} есть слова. 
for val in "$[strarr[@]]"; 
do
  printf "Şval\n"
done
