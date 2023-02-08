mount -t cifs //192.168.1.3/test/ /mnt/docs -o username=amagkh,password=password,iocharset=utf8,file_mode=0777,dir_mode=0777
#!/bin/bash
date
# Папка, куда будем складывать архивы
syst_dir=/backup/
# Имя сервера, который архивируем
srv_name=DNS
# Адрес сервера, который архивируем
srv_ip=127.0.0.1
# Пользователь rsync на сервере, который архивируем
srv_user=backup
# Ресурс на сервере для бэкапа
srv_dir=/mnt/slava
echo "Start backup ${srv_name}"
# Создаем папку для инкрементных бэкапов
mkdir -p ${syst_dir}${srv_name}/increment/
# Запускаем непосредственно бэкап с параметрами
/usr/bin/rsync -a --delete ${srv_dir} ${syst_dir}${srv_name}/current/ --backup --backup-dir=${syst_dir}${srv_name}/increment/`date +%Y-%m-%d`/
# Чистим папки с инкрементными архивами старше 30-ти дней
/usr/bin/find ${syst_dir}${srv_name}/increment/ -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \;
date
echo "Finish backup ${srv_name}"