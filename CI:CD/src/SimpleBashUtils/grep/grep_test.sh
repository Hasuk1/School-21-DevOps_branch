#!/bin/bash

filename1=grep_test.sh;
filename2=s21_grep.c;
# filename3 is also used for -f flag patterns:
filename3=s21_grep.h;


if ! diff -q <(grep int "$filename2" "$filename1") <(./s21_grep int "$filename2" "$filename1"); then
    echo "Integration tests 1 failed"
    exit 1 
fi
if ! diff -q <(grep -e int "$filename2" "$filename1") <(./s21_grep -e int "$filename2" "$filename1"); then
    echo "Integration tests 2 failed"
    exit 1
fi
if ! diff -q <(grep -i int "$filename1") <(./s21_grep -i int "$filename1"); then
    echo "Integration tests 3 failed"
    exit 1
fi
if ! diff -q <(grep -v int "$filename1") <(./s21_grep -v int "$filename1"); then
    echo "Integration tests 4 failed"
    exit 1
fi
if ! diff -q <(grep -c int "$filename1") <(./s21_grep -c int "$filename1"); then
    echo "Integration tests 5 failed"
    exit 1
fi
if ! diff <(grep -l int "$filename2" "$filename3" "$filename1") <(./s21_grep -l int "$filename2" "$filename3" "$filename1"); then
    echo "Integration tests 6 failed"
    exit 1
fi
if ! diff -q <(grep -n int "$filename1") <(./s21_grep -n int "$filename1"); then
    echo "Integration tests 7 failed"
    exit 1
fi
if ! diff -q <(grep -h int "$filename1") <(./s21_grep -h int "$filename1"); then
    echo "Integration tests 8 failed"
    exit 1
fi
if ! diff -q <(grep -o int "$filename1") <(./s21_grep -o int "$filename1"); then
    echo "Integration tests 9 failed"
    exit 1
fi
if ! diff -q <(grep -h int "$filename2" "$filename1") <(./s21_grep -h int "$filename2" "$filename1"); then
    echo "Integration tests 10 failed"
    exit 1
fi
if ! diff -q <(grep int -s aboba) <(./s21_grep int -s aboba); then
    echo "Integration tests 11 failed"
    exit 1
fi
if ! diff -q <(grep -f "$filename3" "$filename2" 2>/dev/null) <(./s21_grep -f "$filename3" "$filename2"); then
    echo "Integration tests 12 failed"
    exit 1
fi
if ! diff -q <(grep -in int "$filename1") <(./s21_grep -in int "$filename1"); then
    echo "Integration tests 13 failed"
    exit 1
fi
if ! diff -q <(grep -cv int "$filename1") <(./s21_grep -cv int "$filename1"); then
    echo "Integration tests 14 failed"
    exit 1
fi
if ! diff -q <(grep -iv int "$filename1") <(./s21_grep -iv int "$filename1"); then
    echo "Integration tests 15 failed"
    exit 1
fi
if ! diff -q <(grep -lv int "$filename2" "$filename3" "$filename1") <(./s21_grep -lv int "$filename2" "$filename3" "$filename1"); then
    echo "Integration tests 16 failed"
    exit 1
fi
if ! diff -q <(grep -ho int "$filename2" "$filename1") <(./s21_grep -ho int "$filename2" "$filename1"); then
    echo "Integration tests 17 failed"
    exit 1
fi
if ! diff -q <(grep -nf "$filename3" "$filename2" 2>/dev/null) <(./s21_grep -nf "$filename3" "$filename2"); then
    echo "Integration tests 18 failed"
    exit 1
fi
echo "All integration tests have been successfully passed"
exit 0
