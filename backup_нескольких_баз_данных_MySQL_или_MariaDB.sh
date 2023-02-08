#!/bin/bash

DB_NAMES=( 'db-hackthesec-site' 'db-hackthesec-blog' 'db-hackthesec-app' ) #replace with your own database name(s)
BKUP_NAMES=()
BKUP_DIR="/backups"

# get total number of directories
total_dbs=${#DB_NAMES[@]}

# create backup file names
for (( i=0; i<${total_dbs}; i++ )); do
    BKUP_NAMES[$i]="`date +%Y%m%d%H%M`-backup-$${DB_NAMES[$i]}.sql.gz"
done

# get backup users credentials
source $BKUP_DIR/.env

# create backups
for (( i=0; i<${total_dbs}; i++ )); do
    # NOTE: --routines flag makes sure stored procedures are also backed up
    mysqldump --routines -u ${MYSQL_USER} -p${MYSQL_PASS} | gzip > ${BKUP_DIR}/${BKUP_NAMES[$i]}
done
