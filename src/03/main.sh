#!/bin/bash

if [ $# -ne 4 ]; then
    echo "ОШИБКА: Нужно задать 4 параметра, которые будут определять: <bg_color_val_names> <font_color_val_names> <bg_color_vals> <font_color_vals>"
    echo "       bg_color_val_names     - это фон названий значений (HOSTNAME, TIMEZONE, USER и т.д.)"
    echo "       font_color_val_names   - это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т.д.)"
    echo "       bg_color_vals          - это фон значений (после знака '=')"
    echo "       font_color_vals        - это цвет шрифта значений (после знака '=')"
    echo "       Обозначения цветов:"
    echo "       1 - белый"
    echo "       2 - красный"
    echo "       3 - зеленый"
    echo "       4 - синий"
    echo "       5 - фиолетовый"
    echo "       6 - черный"
    exit 1
fi

for i in {1..4}; do
    if ! [[ ${!i} =~ ^[1-6]$ ]]; then
        echo "ОШИБКА: Параметры цвета должны быть в диапазоне от 1 до 6."
        echo "       Обозначения цветов:"
        echo "       1 - белый"
        echo "       2 - красный"
        echo "       3 - зеленый"
        echo "       4 - синий"
        echo "       5 - фиолетовый"
        echo "       6 - черный"
        exit 1
    fi
done

if [ "${1}" = "${2}" ] || [ "${3}" = "${4}" ]; then
    echo "ОШИБКА: Цвета шрифта и фона одного столбца не должны совпадать."
    read -p "Желаете запустить скрипт повторно? (Y/N) " choice
    if [[ ${choice} =~ ^[Yy]$ ]]; then
        read -p "bash main.sh " arg
        bash main.sh $arg
        exit 0
    else
        exit 1
    fi
fi

chmod +x ../03/print_colored_info.sh
. ../03/print_colored_info.sh "$@"
