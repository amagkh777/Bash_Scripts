#!/bin/bash

##################### переменные #############################

### Установите правильное местоположение источника и места назначения
SOURCE_DIR="/source/dir/"
DEST_DIR="/desination/dir/"
TMP_FILE=/tmp/copyfileslist.txt

### Установите имя пользователя и имя группы, чтобы установить права на скопированные файлы
### Установите для CHANGE_OWNERSHIP значение 1, чтобы изменить владельца, или 0, чтобы не изменять его.
CHANGE_OWNERSHIP=1
USER='root'
GROUP='root'


########### Не редактируйте, пока не потребуется #################

### Проверка, существует ли исходный каталог
### Скрипт остановится, если источника не существует

if [ -d "${SOURCE_DIR}" ]; then
echo "Source directory found"
else
echo "Source directory not found. Please check above variables are set correctly"
echo "script exited"
exit 1
fi

### Проверка, существует ли каталог назначения
### Скрипт создаст каталог назначения, если он не существует.
### Если не удалось создать каталог, скрипт будет прерван

if [ -d "${DEST_DIR}" ]; then
echo "Destination directory found, all ok"
else
echo "Destination directory not found, creating now"
mkdir -p "${DEST_DIR}"
if [ $? -eq 0 ]; then
echo "Successfully created destination directory."
else
echo "Failed to create destination directory. Script exited"
exit 1
fi
fi


### Копирование всех файлов, доступных в исходном каталоге
### После успешного копирования файла скрипт удалит их из исходного каталога.
cd "${SOURCE_DIR}"

if [ $? -eq 0 ]; then
find . -type f > ${TMP_FILE}

while read CURRENT_FILE_NAME
do
cp --parents "${CURRENT_FILE_NAME}" "${DEST_DIR}"
if [ $? -eq 0 ]; then
echo "File ${CURRENT_FILE_NAME} successfully copied."
rm -f "${CURRENT_FILE_NAME}"
else
echo "File ${CURRENT_FILE_NAME} failed to copy"
fi
done < ${TMP_FILE}
rm -f ${TMP_FILE}
fi

## Установка прав на новые файлы

if [ ${CHANGE_OWNERSHIP} -eq 1 ]; then
sudo chmod 775 -R "${DEST_DIR}"
sudo chown ${USER}:${GROUP} -R "${DEST_DIR}"
fi

################### Конец скрипта ###################################
