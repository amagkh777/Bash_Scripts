#!/bin/bash
FROM=$1 # откуда
TO=$2 # куда
LINKTO=--link-dest=$TO/`basename $FROM`.1 # предыдущая копия
OPTS="-Ca --delete" # полезные опции для rsync
NUMBER_OF_BACKUPS=10 # столько копий мы храним 
# шаманим с переименованием папок, чтобы предыдущие версии сохранялись под именами
# dir.1, dir.2, dir.3 и так далее до dir.9
find $TO -maxdepth 1 -type d -name '*.[0-9]'| sort -rn| while read dir
do
    this=`expr match "$dir" '.*\([0-9]\)'`; 
    let next=($this+1)%$NUMBER_OF_BACKUPS;
    basedirname=${dir%.[0-9]}
    if [ $next -eq 0 ] ; then
         rm -rf $dir
    else
         mv $dir $basedirname.$next
    fi
done
# шаманство закончилось, запускаем rsync
rsync $OPTS $LINKTO $FROM/ $TO/`basename $FROM.0`
