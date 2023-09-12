#!/bin/bash

dir_path=$1

TOTAL_FOLDERS=$(sudo find "$dir_path" -type d | wc -l)
TOP_FOLDERS=$(sudo du -h "$dir_path"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
TOTAL_FILES=$(sudo find "$dir_path" -type f | wc -l)
CONF=$(sudo find "$dir_path" -type f -name "*.conf" | wc -l)
TXT=$(sudo find "$dir_path" -type f -name "*.txt" | wc -l)
EXE=$(sudo find "$dir_path" -type f -executable | wc -l)
LOG=$(sudo find "$dir_path" -type f -name "*.log" | wc -l)
ARCHIVE=$(sudo find "$dir_path" -type f \( -name "*.zip" -o -name "*.7z" -o -name "*.tar" -o -name "*.rar" -o -name "*.gz" \) | wc -l)
LINKS=$(sudo find "$dir_path" -type l | wc -l)
TOP_LARGEST_FILES=$(sudo find "$dir_path" -type f -exec du -h {} + | sort -hr | sed -n '1,10'p | awk '{ext=""; file=$2; sub(".*/", "", file); if (index(file, ".") > 0) { n=split(file, arr, "."); ext=arr[n];} printf "%d - %s, %s%s\n", NR, $2, $1,(ext == "" ? "" : ", "ext)}')
TOP_LARGEST_EXE_FILES=$(sudo find "$dir_path" -type f -executable -exec du -h {} +| sort -hr | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum " $2 " | cut -d\" \" -f1")}')

echo "Total number of folders (including all nested ones) = $TOTAL_FOLDERS"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP_FOLDERS"
echo "Total number of files = $TOTAL_FILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF"
echo "Text files = $TXT"
echo "Executable files = $EXE"
echo "Log files (with the extension .log) = $LOG"
echo "Archive files = $ARCHIVE"
echo "Symbolic links = $LINKS"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP_LARGEST_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$TOP_LARGEST_EXE_FILES"
