#!/bin/bash

backup_dirs=("/etc" "/home" "/boot")
dest_dir="/backup"
dest_server="server1"
backup_date=$(date +%b-%d-%y)

echo "Запуск резервного копирования: ${backup_dirs[@]}"

for i in "${backup_dirs[@]}"; do
sudo tar -Pczf /tmp/$i-$backup_date.tar.gz $i
if [ $? -eq 0 ]; then
echo "$i  копирование прошло успешно."
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


"
Запуск резервного копирования: /etc /home /boot
/etc резервное копирование прошло успешно.
etc-Apr-28-22.tar.gz                                                                                       100%  725KB  46.9MB/s   00:00    
/etc передача прошла успешно.
/home резервное копирование прошло успешно.
home-Apr-28-22.tar.gz                                                                                      100% 3915     1.9MB/s   00:00    
/home передача прошла успешно.
/boot резервное копирование прошло успешно.
boot-Apr-28-22.tar.gz                                                                                      100%  166MB 100.8MB/s   00:01    
/boot передача прошла успешно.
rm: cannot remove '/tmp/*.gzecho': No such file or directory
rm: cannot remove 'Резервное копирование сделано.': No such file or directory"

"