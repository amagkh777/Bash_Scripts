#!/bin/bash


PS3="Выберите операцию: "

select opt in add subtract multiply divide quit; do

  case $opt in
    add)
      read -p "Введите первое число: " n1
      read -p "Введите второе число: " n2
      echo "$n1 + $n2 = $(($n1+$n2))"
      ;;
    subtract)
      read -p "Введите первое число: " n1
      read -p "Введите второе число: " n2
      echo "$n1 - $n2 = $(($n1-$n2))"
      ;;
    multiply)
      read -p "Введите первое число: " n1
      read -p "Введите второе число: " n2
      echo "$n1 * $n2 = $(($n1*$n2))"
      ;;
    divide)
      read -p "Введите первое число: " n1
      read -p "Введите второе число: " n2
      echo "$n1 / $n2 = $(($n1/$n2))"
      ;;
    quit)
      break
      ;;
    *)
      echo "Недопустимая опция $REPLY"
      ;;
  esac
done
