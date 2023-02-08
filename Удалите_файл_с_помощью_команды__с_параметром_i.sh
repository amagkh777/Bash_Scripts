#!/bin/bash

# Считайте имя файла
read -p 'Введите имя файла для удаления: ' filename

# Проверьте, существует ли файл,
if [ -f $filename ] ; then
# Удалить файл с разрешением
rm -i " $filename "
# Проверить, удален ли файл,
if [ -f $filename ] ; then
echo " $filename не удаляется"
else
echo " $filename удален"
fi
else
echo "Файл не существует"
fi
