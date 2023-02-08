#! /bin/bash

# Объявить функцию для аутентификации 
functionAuthenticate() { 
# Установить значения 
username=${1:-guest} password=${2:-12345} 
# Вернуть true, если аргумент не указан
if [[ $username == 'admin'&& $password == 'secret' ]]; then 
echo «Вы вошли в систему как администратор». 
# Возвращает true, если указан один аргумент 
elif [[ $username == 'guest'&& $password == '12345' ]]; then 
echo «Вы вошли в систему как Гость». 
else 
echo «Неверное имя пользователя и пароль». 
fi 
} 
# Функция вызова без аргументов 
Authenticate 
# Функция вызова с действительным именем пользователя и паролем 
Authenticate admin secret 
# Функция вызова с недопустимым именем пользователя и паролем 
Authenticate andreyex 1234
