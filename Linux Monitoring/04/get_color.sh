#!/bin/bash

if [[ ! -f ./colors.conf ]]; then
    echo "ОШИБКА: Файла конфигурации нет!"
    exit 1
fi

col1_bg=$(grep "^column1_background=" colors.conf | cut -d "=" -f 2)
if [[ -z "$col1_bg" ]]; then
    col1_bg=1
fi

col1_font=$(grep "^column1_font_color=" colors.conf | cut -d "=" -f 2)
if [[ -z "$col1_font" ]]; then
    col1_font=4
fi

col2_bg=$(grep "^column2_background=" colors.conf | cut -d "=" -f 2)
if [[ -z "$col2_bg" ]]; then
    col2_bg=4
fi
col2_font=$(grep "^column2_font_color=" colors.conf | cut -d "=" -f 2)
if [[ -z "$col2_font" ]]; then
    col2_font=3
fi

if [ "${col1_bg}" = "${col1_font}" ] || [ "${col2_bg}" = "${col2_font}" ]; then
echo "ОШИБКА: Цвета шрифта и фона одного столбца не должны совпадать, исправьте файл конфигурации."
exit 1
fi

chmod +x ../03/main.sh
. ../03/main.sh ${col1_bg} ${col1_font} ${col2_bg} ${col2_font}

echo ""

color_names=("white" "red" "green" "blue" "purple" "black")

if [ "$col1_bg" = 1 ]; then
  echo "Column 1 background = default (${color_names[$col1_bg - 1]})"
else
  echo "Column 1 background = $col1_bg (${color_names[$col1_bg - 1]})"
fi

if [ "$col1_font" = 4 ]; then
echo "Column 1 font color = default ("${color_names[$col1_font - 1]}")" 
else 
echo "Column 1 font color = $col1_font ("${color_names[$col1_font - 1]}")" 
fi

if [ "$col2_bg" = 4 ]; then
echo "Column 2 background = default ("${color_names[$col2_bg - 1]}")" 
else 
echo "Column 2 background = $col2_bg ("${color_names[$col2_bg - 1]}")" 
fi

if [ "$col2_font" = 3 ]; then
echo "Column 2 font color = default ("${color_names[$col2_font - 1]}")" 
else 
echo "Column 2 font color = $col2_font ("${color_names[$col2_font - 1]}")" 
fi
