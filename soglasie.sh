#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  #определим директорию со скриптом
NUM=($1)


for var in ${NUM[@]}
do

case $var in

                да|ага|ок|понял|правильно|точно|верно|разумеется|неужели|безусловно|конечно|несомненно|однако|действительно|плюс|ну|угу|пусть|аминь|вот|именно|как|же|то|так|точно|йес|легко|алло|ладно|согласен|хорошо|ясно|есть|такое|дело|еще|пусть|будет|само|собой|разумеется|будто|жебо|подлинно|правда|богу|согласный|готовый|подходящий|достойный|подобный|желание|одинаковый|стройный|ага|угу|алло|плюс|верно|правильно|отлично|точно|легко|определённо|ясно|несомненно|однако|также|пусть|ладно|ей|аминь|дык|йес|подлинно|истинно|правда|довольно|безусловно|равно|действительно|безусловно|несомненно|неужели|разумеется|вероятно|конечно|согласен|так|ей|правда|ещё|бы|есть|такое|дело|ну|пусть|будет|будто|именно|что|хорошо|типа|того|действительный|точный|разве|реально|неужто|железобетонно|мдя|слушаюсь|повелитель|яволь|аюшки|агась|воль)
                        echo -n "да"
                        exit 0
                        ;;

                esac



done


exit 0

