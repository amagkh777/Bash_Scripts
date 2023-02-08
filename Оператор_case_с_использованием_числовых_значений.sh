#!/bin/bash

echo -n "Введите значение: "

read VALUE

case $VALUE in

1)

echo "one" ;;

2)

echo "two" ;;

3)

echo "три" ;;

4 | 5)

echo "больше трех" ;;

*)

echo "неизвестное значение" ;;

esac
