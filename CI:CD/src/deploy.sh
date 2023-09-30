#!/bin/bash

CAT_PATH=SimpleBashUtils/cat/s21_cat
GREP_PATH=SimpleBashUtils/grep/s21_grep
PROD_ADRS=perlabru@172.24.116.8
REMOTE_PATH=/usr/local/bin/

scp $CAT_PATH $GREP_PATH $PROD_ADRS:$REMOTE_PATH
ssh $PROD_ADRS ls $REMOTE_PATH