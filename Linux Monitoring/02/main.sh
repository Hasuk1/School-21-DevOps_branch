#!/bin/bash

if [ $# -eq 0 ]; then
    chmod +x print_info.sh save_info.sh
    source ./print_info.sh
    source ./save_info.sh
else
    echo "ОШИБКА: скрипт не принимает параметры."
    exit 1
fi

exit 0
