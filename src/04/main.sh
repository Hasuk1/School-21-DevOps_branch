#!/bin/bash

chmod +x get_color.sh
if [ $# -eq 0 ]; then
    chmod +x get_color.sh
    source ./get_color.sh
else
    echo "ОШИБКА: скрипт не принимает параметры."
    exit 1
fi

exit 0
