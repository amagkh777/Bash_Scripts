#!/usr/bin/env bash

check_spamd_port () {

    # connect to spamd's port
    # redirect outpur to /dev/null to avoid messaging from crontab after successful tests
    nc -z 127.0.0.1 783 > /dev/null
}

send_notify () {

    # send notification with status
    local status=$1
    echo "spamd status == $status" | mail -s "Venti spamd status: $status" boxname@domain.kiev.ua
}

start_spamd () {

    service spamassassin start
}

if ! check_spamd_port; then 
    send_notify "Down" 
    start_spamd && send_notify "Up" || send_notify "Unable to start" 
fi
