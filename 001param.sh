$DIRSTACK - содержимое вершины стека каталогов
$EDITOR - текстовый редактор по умолчанию
$EUID - Эффективный UID. Если вы использовали программу su для выполнения команд от другого пользователя, то эта переменная содержит UID этого пользователя, в то время как...
$UID - ...содержит реальный идентификатор, который устанавливается только при логине.
$FUNCNAME - имя текущей функции в скрипте.
$GROUPS - массив групп к которым принадлежит текущий пользователь
$HOME - домашний каталог пользователя
$HOSTNAME - ваш hostname
$HOSTTYPE - архитектура машины.
$LC_CTYPE - внутренняя переменная, котороя определяет кодировку символов
$OLDPWD - прежний рабочий каталог
$OSTYPE - тип ОС
$PATH - путь поиска программ
$PPID - идентификатор родительского процесса
$SECONDS - время работы скрипта(в сек.)
$# - общее количество параметров переданных скрипту
$* - все аргументы переданыне скрипту(выводятся в строку)
$@ - тоже самое, что и предыдущий, но параметры выводятся в столбик
$! - PID последнего запущенного в фоне процесса
$$ - PID самого скрипта

-z # строка пуста
-n # строка не пуста
=, (==) # строки равны
!= # строки неравны
-eq # равно
-ne # неравно
-lt,(< ) # меньше
-le,(<=) # меньше или равно
-gt,(>) #больше
-ge,(>=) #больше или равно
! #отрицание логического выражения
-a,(&&) #логическое «И»
-o,(||) # логическое «ИЛИ»-e  
Проверить что файл существует (-f, -d)
-f  Файл существует (!-f - не существует) 
-d  Каталог существует
-s  Файл существует и не пустой
-r  Файл существует и доступен на чтение
-w  ... на запись
-x  ... на выполнение
-h  Символическая ссылка
-b  Файл существует и является блочным устройством
-с  Файл существует и является символьным устройством (character device)
-p  Файл существует и является потоковым устройством (pipe device)
-S  Файл существует и является сокетом\ - с обратной косой черты начинаются буквенные спецсимволы, а также он используется
если нужно использовать спецсимвол в виде какого-либо знака препинания;

============================================================================================================================================



'REgEXP'

'Якоря'
    ^  Начало строки
    \A Началотекста
    $  Конецстроки
    \Z Конецтекста
    \b Граница слова
    \B Не граница слова
    \< Начало слова
    \> Конецслова
'Символьные классы'
    \c Управляющийсимвол
    \s Пробел
    \S Не пробел
    \d Цифра
    \D Не цифра
    \w Слово
    \W Не слово
    \xhh Шестнадцатиричный символhh
    \Oxxx Восьмиричный символ xx
'Символьные классы POSIX'
    [:upper:] Буквы в верхнем регистре
    [:lower:] Буквы в нижнем регистре
    [:alpha:] Все буквы
    [:alnum:] Буквы и цифры
    [:digit:] Цифры
    [:xdigit:] Шестнадцатиричные цифры
    [:punct:] Пунктуация
    [:blank:] Пробел и табуляция
    [:space:] Пустые символы
    [:cntrl:] Управляющиесимволы
    [:graph:] Печатныесимволы
    [:print:] Печатныесимволы и пробелы
    [:word:] Буквы, цифры и подчеркивание
'Утверждения'
    ?= Вперед смотрящее
    ?! Отрицательное вперед смотрящее
    ?<= Назад смотрящее!= или
    ?Отрицательное назад смотрящее
    ?> Однократное подвыражение
    ?() Условие [если, то]
    ?()| Условие[если, то, аиначе]
    ? # Комментарий
'Образцы шаблонов'   
    ([A-Za-z0-9-]+) Буквы, числа и знаки переноса
    (\d{1,2}\/\d{1,2}\/\d{4}) Дата (напр., 21/3/2006)
    ([^\s]+(?=\.(jpg|gif|png))\.\2) Имя файла jpg, gif или png
    (^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$) Любое число от 1 до 50 включительно
    (#?([A-Fa-f0-9]){3}(([A-Fa-f0-9]){3})?) Шестнадцатиричныйкодцвета
    ((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}) От 8 до 15 символов с минимум одной цифрой, одной заглавной и одной строчной буквой (полезно для паролей)
    (\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,6}) Адрес email
    (\<(/?[^\>]+)\>) HTML теги
'Кванторы'
    *  0 или больше
    *? 0 или больше, нежадный
    +  1 или больше
    +? 1 или больше, нежадный
    ?  0 или 1 
    ?? 0 или1, нежадный
    {3} Ровно 3 
    {3,} 3 или больше
    {3,5} 3, 4 или 5 
    {3,5}? 3, 4 или 5, нежадный
'Специальные символы'
    \Экранирующий символ
    \n Новая строка
    \r Возврат каретки
    \t Табуляция
    \v Вертикальная табуляция
    \f Новая страница
    \a Звуковой сигнал
    [\b] Возврат на один символ
    \e Escape-символ
    \N{name} Именованыйсимвол
'Подстановка строк'
    $n n-аянепассивнаягруппа
    $2 «xyz» в /^(abc(xyz))$/
    $1 «xyz» в /^(?:abc)(xyz)$/
    $` Перед найденной строкой
    $' После найденной строки'
    $+ Последняя найденная строка
    $& Найденная строка целиком
    $_ Исходный текст целиком
    $$ Символ «$
'Диапазоны'
    . Любой символ, кроме переноса строки (\n) 
    (a|b) a или b 
    (...) Группа
    (?:...) Пассивнаягруппа
    [abc] Диапазон (a или b или c) 
    [^abc] Не a, не b и не c 
    [a-q] Буква между a и q 
    [A-Q] Буква в верхнем регистре между A и Q 
    [0-7] Цифра между 0 и 7 
    \n n-аягруппа/подшаблон
    
'Мета-символы(экранируются)'
    ^ [ .$ { *( \ +) | ?< >