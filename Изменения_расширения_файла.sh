#! /bin/bash
echo "Введите целевой каталог"
read target_dir
cd $ target_dir

echo "Введите расширение файла для поиска без точки"
read old_ext

echo "Введите новое расширение файла для переименования без точки"
read new_ext

echo " $ target_dir, $ old_ext, $ new_ext "

for file in *.$old_ext
do
mv -v "$file" "${file%.$old_ext}.$new_ext"
done;
