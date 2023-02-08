#!/bin/bash
# Функция возвращает значение
multiplication () {
expr $1 \* $2
}
ans=$(multiplication $1 $2)
echo Умножение $1 на $2 равно: $ans

