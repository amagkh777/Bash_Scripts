#!/bin/bash
  
uniq="$(asterisk -rx "sip show peers"|grep "/$1"|awk '{print ""$1""}'| sed 's/\/.*$//')"

reg="$(/usr/sbin/asterisk -rx "sip show peer ${uniq}"| grep "Reg. Contact"|awk '{print ""$4""}'|cut -d: -f2|sed 's/[0-9]*@//')"

echo $reg