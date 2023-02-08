#!/bin/bash
jira_home="/home/jira/atlassian"
bklog="/var/log/jira_backup.log"
dbkdir="/home/jira/backup/files/daily"
wbkdir="/home/jira/backup/files/weekly"
manbkdir="/home/jira/backup/files/manual"

mdbkdir="/home/jira/backup/mysql/daily"
mwbkdir="/home/jira/backup/mysql/weekly"
manmbkdir="/home/jira/backup/mysql/manual"

curdate=`date +%Y-%M-%d-%H:%M:%S`
ardate=`echo $curdate  | sed -e 's/:/_/g' -e 's/-/_/g'`
wday=`date +%a`

usage () {
cat << EOF

Usage: $0 [ options ]

This script can create full or incremental backup of JIRA and it's database.

Available options are:

 -h | help - show this help and exit;
 -m | manual - run full backup in to directory "Files manual" and "MySQL manual" directories;
 -a | auto - if started at Sunday will run full backup in to "Files weekly" and "MySQL weekly" directories, otherwise - will copy only files modified last 24 hour in to "Files daily" and "MySQL daily".

Directories list:

Files daily: $dbkdir
Files weekly: $wbkdir
Files manual: $manbkdir

MySQL daily: $mdbkdir
MySQL weekly: $mwbkdir
MySQL manual: $manmbkdir

Daily backups stored 7 days. Weekly - 4 copies (i.e. - one month).

EOF
}

clean_daily () {
while [[ ! -z $@ ]]
do
  echo -e "Cleaning directory $1 - deleting archives older than 7 days...n"
  # в переданных аргументами директориях находим и удаляем архивы старше 7-ми дней
  find $1 -mtime +7 -exec rm -f {} ;
  shift
done
}

clean_weekly () {
while [[ ! -z $@ ]]
do
  echo -e "Cleaning directory $1 - deleting old archives...n"
  # в переданных аргументами директориях находим и удаляем все архивы, кроме последних 4-х
  cd $1
  [[ `pwd` == $1 ]] && rm -f `ls -1 | tail -n +5` || { echo "Wrong dir $1! Exit."; exit 1; }
  shift
done
}

files_full_backup () {
  echo -e "Archiving files...n"
  tar cjpf "$1/full_files_$ardate.tar.bz2" "$jira_home"
}

files_inc_backup () {
  echo -e "Archiving files...n"
  find $jira_home -mtime -1 -exec tar cvjpf "$1/inc_files_$ardate.tar.bz2" {} ;
}

mysql_backup () {
  echo -e "Dumping database...n"
  mysqldump -u dbuser -pdbpass dbname > $1/dbname_$ardate.sql
}

{
[[ -z $1 ]] && usage

auto=0
manual=0

while getopts "ham" opt; do
  case $opt in
        h)
          usage && exit 1
          ;;
        a)
          auto=1
          ;;
        m)
          manual=1
          ;;
        ?)
          usage && exit 1
          ;;
  esac
done

if [ $auto == 1 ]; then

  echo -e "Started automated backup process at $curdate.n"
  if [ $wday != Sun ]
  then
    echo -e "As today is not Sunday - I'll start incremental backup.n"
    files_inc_backup $dbkdir
    mysql_backup $mdbkdir
    clean_daily $dbkdir $mdbkdir
  else
    echo -e "As today is Sunday - I'll start full backup.n"
    files_full_backup $wbkdir
    mysql_backup $mwbkdir
    clean_weekly $wbkdir $mwbkdir
  fi
fi

if [ $manual == 1 ]; then
  files_full_backup $manbkdir
  mysql_backup $manmbkdir
fi

echo -e "Backup finished at $curdate.n"
} 2>&1 | tee -a "$bklog"







!!!!!!!!!!!!!!!!!!!!!!!!!!!

$ ./jira_backup.sh -h

Usage: ./jira_backup.sh [ options ]

This script can create full or incremental backup of JIRA and it's database.

Available options are:

 -h | help - show this help and exit;
 -m | manual - run full backup in to directory "Files manual" and "MySQL manual" directories;
 -a | auto - if started at Sunday will run full backup in to "Files weekly" and "MySQL weekly" directories, otherwise - will copy only files modified last 24 hour in to "Files daily" and "MySQL daily".

Directories list:

Files daily: /home/jira/backup/files/daily
Files weekly: /home/jira/backup/files/weekly
Files manual: /home/jira/backup/files/manual

MySQL daily: /home/jira/backup/mysql/daily
MySQL weekly: /home/jira/backup/mysql/weekly
MySQL manual: /home/jira/backup/mysql/manual

Daily backups stored 7 days. Weekly - 4 copies (i.e. - one month).

All activities written to log /var/log/jira_backup.log.

30 1 * * * /home/jira/bin/jira_backup.sh -a

