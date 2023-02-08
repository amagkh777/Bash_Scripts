#!/bin/bash

echo "Введите свое имя, фамилию и должность.
read string
IFS=
read -a strarr <<< "Şstring"
echo "Имя : ${strarr[0]}
echo "Фамилия : ${strarr[1]}"
echo "Должность : ${starr[2]]
