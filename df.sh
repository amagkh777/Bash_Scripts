#!/bin/bash
filesystems=("/" "/apps" "/database")
for i in ${filesystems[@]}; do
usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)
if [ $usage -ge 90 ]; then
alert="Заканчивается свободное место на $i, Usage is: $usage%"
echo "Отправка оповещения о дисковом пространстве по электронной почте."
echo $alert | mail -s "$i is $usage% full" your_email
fi
done