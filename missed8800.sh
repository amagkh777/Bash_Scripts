#!/bin/bash
cd /var/www/html/phone/
echo -n > missedCALL8800

grep "Астраханская" /var/www/html/phone/cdr88001|grep 8800|grep -c "вке" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88001|grep 8800|grep -c "вке" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88001|grep 8800|grep -c "вке" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88001|grep 8800|grep -c "вке" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88001|grep 8800|grep -c "вке" >> missedCALL8800


grep "Астраханская" /var/www/html/phone/cdr88001|grep 8800|grep -c "реди" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88001|grep 8800|grep -c "реди" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88001|grep 8800|grep -c "реди" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88001|grep 8800|grep -c "реди" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88001|grep 8800|grep -c "реди" >> missedCALL8800

grep "Астраханская" /var/www/html/phone/cdr88002|grep 8800|grep -c "вке" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88002|grep 8800|grep -c "вке" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88002|grep 8800|grep -c "вке" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88002|grep 8800|grep -c "вке" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88002|grep 8800|grep -c "вке" >> missedCALL8800


grep "Астраханская" /var/www/html/phone/cdr88002|grep 8800|grep -c "реди" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88002|grep 8800|grep -c "реди" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88002|grep 8800|grep -c "реди" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88002|grep 8800|grep -c "реди" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88002|grep 8800|grep -c "реди" >> missedCALL8800

grep "Астраханская" /var/www/html/phone/cdr88003|grep 8800|grep -c "вке" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88003|grep 8800|grep -c "вке" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88003|grep 8800|grep -c "вке" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88003|grep 8800|grep -c "вке" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88003|grep 8800|grep -c "вке" >> missedCALL8800


grep "Астраханская" /var/www/html/phone/cdr88003|grep 8800|grep -c "реди" >> missedCALL8800
grep "Волгоградская" /var/www/html/phone/cdr88003|grep 8800|grep -c "реди" >> missedCALL8800
grep "Липецкая" /var/www/html/phone/cdr88003|grep 8800|grep -c "реди" >> missedCALL8800
grep "Орловская" /var/www/html/phone/cdr88003|grep 8800|grep -c "реди" >> missedCALL8800
grep "Челябинская" /var/www/html/phone/cdr88003|grep 8800|grep -c "реди" >> missedCALL8800

