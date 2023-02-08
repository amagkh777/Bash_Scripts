#!/bin/bash
1)bsdtar -cjf "$1".tar.bz2 "$1" &&
2)#bsdtar -cjf "$1".tar.bz2 "$@" &&
echo "bsdtar - OK" > results.txt ||
{ echo "bsdtar - FAILS" > results.txt ; exit 1 ; }

mv -f "$1".tar.bz2 /d &&
echo "cp - OK" >> results.txt ||
! echo "cp - FAILS" >> results.txt



1)find ~/Documents -type f -name "*.pdf" -exec make-backup.sh {} \; -копия каждого файла найденого
2)find ~/Documents -type f -name *.pdf -exec make-backup.sh {} +    -копия всех файлов в одном архиве
