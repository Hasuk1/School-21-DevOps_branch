#!/bin/bash

#1
./s21_cat bytes.txt >> s21_cat.txt
cat bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then 
    echo "Integration tests 1 failed"
    rm s21_cat.txt cat.txt
    exit 1 
else
    rm s21_cat.txt cat.txt
fi
#2 -b
./s21_cat -b bytes.txt >> s21_cat.txt
cat -b bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 2 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#3 -e
./s21_cat -e bytes.txt >> s21_cat.txt
cat -e bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 3 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#4 -n
./s21_cat -n bytes.txt >> s21_cat.txt
cat -n bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 4 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#5 -s
./s21_cat -s bytes.txt >> s21_cat.txt
cat -s bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 5 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#6 -t
./s21_cat -t bytes.txt >> s21_cat.txt
cat -t bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 6 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#7 -ne
./s21_cat -ne bytes.txt >> s21_cat.txt
cat -ne bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 7 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#8 -bet
./s21_cat -be bytes.txt >> s21_cat.txt
cat -b -e bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 8 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#9 -set
./s21_cat -set bytes.txt >> s21_cat.txt
cat -set bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 9 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#10 -sv
./s21_cat -sv bytes.txt >> s21_cat.txt
cat -sv bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 10 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#11 -sn
./s21_cat -sn bytes.txt >> s21_cat.txt
cat -sn bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 11 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#12 -sb
./s21_cat -sb bytes.txt >> s21_cat.txt
cat -sb bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 12 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
#13 -nb
./s21_cat -nb bytes.txt >> s21_cat.txt
cat -nb bytes.txt >> cat.txt
if ! diff -q s21_cat.txt cat.txt; then
    echo "Integration tests 13 failed"
    rm s21_cat.txt cat.txt
    exit 1
else
    rm s21_cat.txt cat.txt
fi
echo "All integration tests have been successfully passed"
exit 0