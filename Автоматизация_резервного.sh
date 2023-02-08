#!/bin/bash

backup_dirs=("/etc" "/home" "/boot")
dest_dir="/backup"
dest_server="server1"
backup_date=$(date +%b-%d-%y)

echo "Запуск резервного копирования: ${backup_dirs[@]}"

for i in "${backup_dirs[@]}"; do
sudo tar -Pczf /tmp/$i-$backup_date.tar.gz $i
if [ $? -eq 0 ]; then
echo "$i резервное копирование прошло успешно."
else
echo "$i ошибка резервного копирования."
fi
scp /tmp/$i-$backup_date.tar.gz $dest_server:$dest_dir
if [ $? -eq 0 ]; then
echo "$i передача прошла успешно."
else
echo "$i передача не удалось."
fi
done

sudo rm /tmp/*.gzecho "Резервное копирование сделано."
