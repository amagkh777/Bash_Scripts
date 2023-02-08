#!/bin/bash

servers=$(cat servers.txt)

echo -n "Введите имя: "
read name
echo -n "Введите пользователя id: "
read uid

for i in $servers; do
echo $i
ssh $i "sudo useradd -m -u $uid ansible"
if [ $? -eq 0 ]; then
echo "Пользователь $name добавлен $i"
else
echo "Ошибка $i"
fi
done