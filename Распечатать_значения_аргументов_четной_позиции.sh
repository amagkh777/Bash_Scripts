#!/bin/bash

# Подсчитайте общее количество аргументов командной строки
total=$#
echo "Итого аргументы таковы: $total"

echo "Значения аргументов четной позиции являются:"
while [ $total -ge 0 ];
do
# Выведите значение аргумента с пробелом
echo -n $1 " "
# Сдвиньте два аргумента
shift 2
# Уменьшите счетчик на 2
((total=$total-2))
done

# Добавить новую линию
echo
