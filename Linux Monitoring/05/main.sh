#!/bin/bash

chmod +x get_dir_info.sh

if [ $# != 1 ] || [ $# = 0 ]; then
    echo "ОШИБКА: Скрипт принимает только один параметр.";
    exit 1
elif ! [ -d $1 ]; then
    echo "ОШИБКА: Указанный каталог не существует";
    exit 1
elif [ ${1: -1} != "/" ]; then
    echo "ОШИБКА: Путь до каталога должен заканчиваться на /";
    exit 1
else
    ./get_dir_info.sh $@
fi

echo "Script execution time (in seconds) = $SECONDS"