#!/bin/bash

CHAR=$1

case $CHAR in
[a-z])
echo "Маленький Алфавит." ;;
[A-Z])
echo "Большой Алфавит." ;;
[0-9])
echo "Число." ;;
*)
echo "Специальный символ."
esac