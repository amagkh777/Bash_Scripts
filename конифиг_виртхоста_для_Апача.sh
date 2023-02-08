#!/bin/sh
[ -z $1 ] && (echo "Enter hostname"; exit 1)
[ -z $2 ] && (echo "Enter IP"; exit 1)
HTTPD=/etc/httpd/conf.d
BASE=/home
USER=www
VHOST="$BASE/$USER/$1/htdocs"
mkdir -p $VHOST
chown -R $USER:$USER $BASE/$USER/$1
cat << EOF > $HTTPD/$1.conf
<VirtualHost $2:80>
	ServerName $1
	ServerAlias www.$1
	DocumentRoot $VHOST
	ErrorLog /var/log/httpd/$1.error_log
	CustomLog /var/log/httpd/$1.log combined
</VirtualHost>
EOF
service httpd reload
