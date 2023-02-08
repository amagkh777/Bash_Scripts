#!/usr/bin/env bash

# имя процесса, который мониторим (используется в grep)
PNAME="/usr/sbin/mysql"
# а для top-а пришлось отдельно имя давать
TNAME="mysqld"
# получаем PID процесса MySQL
getpid () {
  MPID=`ps axo pid,command | grep $1 | grep -v grep | cut -d' ' -f 1`
}

processes_number () {
  # считаем количество процессов MySQL
  CPID=`ps axo pid,command | grep $1 | grep -v grep | cut -d' ' -f 2 | wc -l`
}

process_info () {
  # % времени затраченный CPU на обработку процесса (все потоки + сам процесс / на количество процессоров)
  PICPU=`top -p $MPID -b -n 1 | grep -w $1 | awk '{print $9}'`
  # % от MemTotal (/proc/meminfo)
  # можно обойтись без ps, просто брать данные из /proc/meminfo и
  # считать /proc/$MPID/status VmRSS от неё
  PIMEM=`ps axo %mem,command | grep -v grep | grep /usr/sbin/mysqld | awk '{print $1}'`
  # реально используемая память (resident memory)
  PIRSS=`cat /proc/$MPID/status | grep VmRSS | awk '{print $2}'`
}

process_threads () {
  # количество потоков MySQL
  PT=`ps -eLf | grep "/usr/sbin/mysqld" | grep -v grep | wc -l`
}

load_average () {
  # текущее значение Load Average
  LA=`uptime | cut -d' ' -f 12 | sed 's/,//'`
}

# PID нам нужен один раз, поэтому запускаем функцию не в цикле
getpid $PNAME
# просто стартуем скрипт, и выходим по Ctrl+C
while true; do
  processes_number $PNAME
  process_info $TNAME
  process_threads
  load_average
  printf "PID: %s, Process numbers: %s, process threads: %s, CPU: %s%%, MEM: %s%%, RSS: %s KB, Current LA: %sn" $MPID $CPID $PT $PICPU $PIMEM $PIRSS $LA
# без sleep больше информации, но может быть неудобно
#  sleep 1
done
