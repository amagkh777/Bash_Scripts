#!/bin/bash
#
# Установка WordPress на Debian/Ubuntu
#

# Создание базы данных MySQL
read -p "Введите ваш пароль на MySQL root: " rootpass
read -p "Имя базы данных: " dbname
read -p "Имя пользователя базы данных: " dbuser
read -p "Введите пароль пользователя $dbuser: " userpass
echo "CREATE DATABASE $dbname;" | mysql -u root -p$rootpass
echo "CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$userpass';" | mysql -u root -p$rootpass
echo "GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost';" | mysql -u root -p$rootpass
echo "FLUSH PRIVILEGES;" | mysql -u root -p$rootpass
echo "Новая база данных MySQL успешно создана"

# Скачивание, распаковка и настройка WordPress
read -r -p "Введите ваш URL WordPress? [e.g. mywebsite.com]: " wpURL
wget -q -O - "http://wordpress.org/latest.tar.gz" | tar -xzf - -C /var/www --transform s/wordpress/$wpURL/
chown www-data: -R /var/www/$wpURL && cd /var/www/$wpURL
cp wp-config-sample.php wp-config.php
chmod 640 wp-config.php
mkdir uploads
sed -i "s/database_name_here/$dbname/;s/username_here/$dbuser/;s/password_here/$userpass/" wp-config.php

# Создание виртуального хоста Apache
echo "
ServerName $wpURL
ServerAlias www.$wpURL
DocumentRoot /var/www/$wpURL
DirectoryIndex index.php

Options FollowSymLinks
AllowOverride All

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
" > /etc/apache2/sites-available/$wpURL

# Включить сайт
a2ensite $wpURL
service apache2 restart

# Output
WPVER=$(grep "wp_version = " /var/www/$wpURL/wp-includes/version.php |awk -F\' '{print $2}')
echo -e "\nWordPress version $WPVER успешно установлена!"
echo -en "\aПожалуйста перейдите по адресу http://$wpURL и закончите установку\n"
