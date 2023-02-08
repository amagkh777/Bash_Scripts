$DIRSTACK - содержимое вершины стека каталогов
$EDITOR - текстовый редактор по умолчанию
$EUID - Эффективный UID. Если вы использовали программу su для выполнения команд от другого пользователя, то эта переменная содержит UID этого пользователя, в то время как...
$UID - ...содержит реальный идентификатор, который устанавливается только при логине.
$FUNCNAME - имя текущей функции в скрипте.
$GROUPS - массив групп к которым принадлежит текущий пользователь
$HOME - домашний каталог пользователя
$HOSTNAME - ваш hostname
$HOSTTYPE - архитектура машины.
$LC_CTYPE - внутренняя переменная, котороя определяет кодировку символов
$OLDPWD - прежний рабочий каталог
$OSTYPE - тип ОС
$PATH - путь поиска программ
$PPID - идентификатор родительского процесса
$SECONDS - время работы скрипта(в сек.)
$# - общее количество параметров переданных скрипту
$* - все аргументы переданыне скрипту(выводятся в строку)
$@ - тоже самое, что и предыдущий, но параметры выводятся в столбик
$! - PID последнего запущенного в фоне процесса
$$ - PID самого скрипта

-z # строка пуста
-n # строка не пуста
=, (==) # строки равны
!= # строки неравны
-eq # равно
-ne # неравно
-lt,(< ) # меньше
-le,(<=) # меньше или равно
-gt,(>) #больше
-ge,(>=) #больше или равно
! #отрицание логического выражения
-a,(&&) #логическое «И»
-o,(||) # логическое «ИЛИ»-e  
Проверить что файл существует (-f, -d)
-f  Файл существует (!-f - не существует) 
-d  Каталог существует
-s  Файл существует и не пустой
-r  Файл существует и доступен на чтение
-w  ... на запись
-x  ... на выполнение
-h  Символическая ссылка
-b  Файл существует и является блочным устройством
-с  Файл существует и является символьным устройством (character device)
-p  Файл существует и является потоковым устройством (pipe device)
-S  Файл существует и является сокетом\ - с обратной косой черты начинаются буквенные спецсимволы, а также он используется
если нужно использовать спецсимвол в виде какого-либо знака препинания;
^ - указывает на начало строки;
$ - указывает на конец строки;
* - указывает, что предыдущий символ может повторяться 0 или больше раз;
+ - указывает, что предыдущий символ должен повторится больше один или больше раз;
? - предыдущий символ может встречаться ноль или один раз;
{n} - указывает сколько раз (n) нужно повторить предыдущий символ;
{N,n} - предыдущий символ может повторяться от N до n раз;
. - любой символ кроме перевода строки;
[az] - любой символ, указанный в скобках;
х|у - символ x или символ y;
[^az] - любой символ, кроме тех, что указаны в скобках;
[a-z] - любой символ из указанного диапазона;
[^a-z] - любой символ, которого нет в диапазоне;
\b - обозначает границу слова с пробелом;
\B - обозначает что символ должен быть внутри слова, например, ux совпадет с uxb
или tuxedo, но не совпадет с Linux;
\d - означает, что символ - цифра;
\D - нецифровой символ;
\n - символ перевода строки;
\s - один из символов пробела, пробел, табуляция и так далее;
\S - любой символ кроме пробела;
\t - символ табуляции;
\v - символ вертикальной табуляции;
\w - любой буквенный символ, включая подчеркивание;
\W - любой буквенный символ, кроме подчеркивания;
\uXXX - символ Unicdoe.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
скрипт архивирования
1)find ~/Documents -type f -name "*.pdf" -exec make-backup.sh {} \; -копия каждого файла найденого
2)find ~/Documents -type f -name *.pdf -exec make-backup.sh {} +    -копия всех файлов в одном архиве

#!/bin/bash
1)bsdtar -cjf "$1".tar.bz2 "$1" &&
2)#bsdtar -cjf "$1".tar.bz2 "$@" &&
echo "bsdtar - OK" > results.txt ||
{ echo "bsdtar - FAILS" > results.txt ; exit 1 ; }

mv -f "$1".tar.bz2 /d &&
echo "cp - OK" >> results.txt ||
! echo "cp - FAILS" >> results.txt

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------RSYNC---------------------------------------------
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
-------------------------------------------------IPTABLES.CLEAN.SH---------------------------------------------
#!/bin/sh
echo "Stopping firewall and allowing everyone..."
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
------------------------------------------------IPTABLES.SH----------------------------------------------
#!/bin/bash
#
# Объявление переменных
export IPT="iptables"
# Интерфейс который смотрит в интернет
export WAN=ens160
export WAN_IP=192.168.1.20
# Очистка всех цепочек iptables
$IPT -F
$IPT -F -t nat
$IPT -F -t mangle
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X
# Установим политики по умолчанию для трафика, не соответствующего ни одному из правил
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP
# разрешаем локальный траффик для loopback
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT
# Разрешаем исходящие соединения самого сервера
$IPT -A OUTPUT -o $WAN -j ACCEPT
# Состояние ESTABLISHED говорит о том, что это не первый пакет в соединении.
# Пропускать все уже инициированные соединения, а также дочерние от них
$IPT -A INPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
# Пропускать новые, а так же уже инициированные и их дочерние соединения
$IPT -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
# Разрешить форвардинг для уже инициированных и их дочерних соединений
$IPT -A FORWARD -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
# Включаем фрагментацию пакетов. Необходимо из за разных значений MTU
$IPT -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
# Отбрасывать все пакеты, которые не могут быть идентифицированы # и поэтому не могут иметь определенного статуса.
$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A FORWARD -m state --state INVALID -j DROP
# Приводит к связыванию системных ресурсов, так что реальный
# обмен данными становится не возможным, обрубаем
$IPT -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
$IPT -A OUTPUT -p tcp ! --syn -m state --state NEW -j DROP
# Рзрешаем пинги
$IPT -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
# Открываем порт для ssh
$IPT -A INPUT -i $WAN -p tcp --dport 22 -j ACCEPT
# Открываем порт для squid
$IPT -A INPUT -i $WAN -p tcp --dport 3128 -j ACCEPT
# Открываем порт для http
$IPT -A INPUT -i $WAN -p tcp --dport 80 -j ACCEPT
# Открываем порт для https
$IPT -A INPUT -i $WAN -p tcp --dport 443 -j ACCEPT
# Открываем порт для dns statistic
$IPT -A INPUT -i $WAN -p tcp --dport 8053 -j ACCEPT
# Открываем порт для zabbix
$IPT -A INPUT -i $WAN -p tcp --dport 10050 -j ACCEPT
# Логирование
# Все что не разрешено, но ломится отправим в цепочку undef
$IPT -N undef_in
$IPT -N undef_out
$IPT -N undef_fw
$IPT -A INPUT -j undef_in
$IPT -A OUTPUT -j undef_out
$IPT -A FORWARD -j undef_fw
# Логируем все из undef
$IPT -A undef_in -j LOG --log-level info --log-prefix "-- IN -- DROP "
$IPT -A undef_in -j DROP
$IPT -A undef_out -j LOG --log-level info --log-prefix "-- OUT -- DROP "
$IPT -A undef_out -j DROP
$IPT -A undef_fw -j LOG --log-level info --log-prefix "-- FW -- DROP "
$IPT -A undef_fw -j DROP
# Записываем правила
iptables-save > /etc/iptables.up.rules
----------------------------------------------UTIL.SH------------------------------------------------
#!/bin/bash
yum install -y cockpit iftop htop atop lsof wget bzip2 bind-utils iptables-services traceroute gdisk nmap mc net-tools vim mc epel-release iptstate
cp /usr/share/mc/syntax/sh.syntax /usr/share/mc/syntax/unknown.syntax
vim /etc/sysconfig/selinux SELINUX=disabled
systemctl stop firewalld
systemctl disable firewalld


-----------------------------------------------POSTFIX-----------------------------------------------
apt-get install postfix mailutils
vim /etc/postfix/main.cf
------------------------
# See /usr/share/postfix/main.cf.dist for a commented, more complete version
# Debian specific: Specifying a file name will cause the first
# line of that file to be used as the name. The Debian default
# is /etc/mailname.
#myorigin = /etc/mailname
smtpd_banner = $myhostname ESMTP $mail_name (Ubuntu)
biff = no
# appending .domain is the MUA's job.
append_dot_mydomain = no
# Uncomment the next line to generate "delayed mail" warnings
#delay_warning_time = 4h
readme_directory = no
# See http://www.postfix.org/COMPATIBILITY_README.html -- default to 2 on
# fresh installs.
compatibility_level = 2
# TLS parameters
smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
smtpd_use_tls=yes
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
# See /usr/share/doc/postfix/TLS_README.gz in the postfix-doc package for
# information on enabling SSL in the smtp client.
smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
myhostname = asterisk.corp.vm
alias_maps = hash:/etc/aliases
alias_database = hash:/etc/aliases
myorigin = /etc/mailname
mydestination = $myhostname, asterisk.corp.vm, asterisk, localhost.localdomain, localhost
#relayhost =
mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
mailbox_size_limit = 0
recipient_delimiter = +
inet_interfaces = all
inet_protocols = all
# SMTP YANDEX CONFIG
relayhost = smtp.gmail.com:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
# База параметров авторизации с SMPT
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
# Беза подмены имени почтового ящика
smtp_generic_maps = hash:/etc/postfix/generic
smtp_sasl_security_options = noanonymous
smtp_tls_security_level = may
vim /etc/postfix/generic
------------------------
root@asterisk.corp.vm amagkh777@gmail.com
vim /etc/postfix/sasl_passwd
-----------------------------
smtp.gmail.com:587 amagkh777@gmail.com:1q2w!Q@W1q2w
postmap /etc/postfix/generic
----------------------------
postmap /etc/postfix/sasl_passwd
---------------------------------
uname -a | mail -s "info serve r" amagkh777@gmail.com