#! /bin/bash
# Печатать значения аргументов командной строки, используя цикл for и while
# Установить счетчик
i=1
echo "Значения аргументов без команды shift:"
# Повторите все значения, используя цикл for
for value in "$@"
do
echo "Аргумента нет. $i = $value"
((i++))
done

# Повторная инициализация счетчика
i=1
# Установите необязательный аргумент
start=${1:-""}

echo "Значения аргументов с помощью команды shift:"
# Повторите все значения, используя цикл while
while [ "$start" != "" ];
do
echo "Argument no. $i = $start"
# Сдвиньте каждый аргумент на 1
shift
start=$1
((i++))
done
