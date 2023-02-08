#!/bin/bash

declare -a my_array=( "Водород" "Гелий" "Литий" "Бериллий" )

# длина массива
length=${#my_array[@]}

# Цикл по массиву
for (( i=0; i < ${length}; i++ ))
do
  echo $i ${my_array[$i]}
done
