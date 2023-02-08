#!/bin/bash

# выдаём запрос Y/n на выполнение скрипта проверки места
read -r -p "Do you want run check_space script first? [Y/n] " response

# читаем полученный ответ
case $response in

# если Y, y, Yes - запускаем скрипт check_space.sh
[yY][eE][sS]|[yY])
./check_space.sh
;;

# если любое другое значение - просто продолжаем выполнение echo.sh
*)
echo "Let's start..."
;;
esac

# получаем код выхода скрипта check_space.sh
result=$?

echo $result

# если ответ не 0 - прерываем выполнение
if [ $result != 0 ]
then
echo "Exiting"
exit
else
# если получили 0 - продолжаем выполнение
echo "Proceeding"
fi

echo "Doing something..."
