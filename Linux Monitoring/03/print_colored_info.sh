#!/bin/bash

chmod +x ../02/get_info.sh
source ./../02/get_info.sh
bg_color=('47' '41' '42' '44' '45' '40')
font_color=('97' '91' '92' '94' '95' '90')

bg_val_names=${bg_color[$1 - 1]}
font_val_names=${font_color[$2 - 1]}
bg_vals=${bg_color[$3 - 1]}
font_vals=${font_color[$4 - 1]}

printf "\e[${bg_val_names};${font_val_names}mHOSTNAME = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$HOSTNAME"
printf "\e[${bg_val_names};${font_val_names}mTIMEZONE = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$(cur_timezone)"
printf "\e[${bg_val_names};${font_val_names}mUSER = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$USER"
printf "\e[${bg_val_names};${font_val_names}mOS = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$(cur_os_name)"
printf "\e[${bg_val_names};${font_val_names}mDATE = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$DATE"
printf "\e[${bg_val_names};${font_val_names}mUPTIME = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$UPTIME"
printf "\e[${bg_val_names};${font_val_names}mUPTIME_SEC = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$UPTIME_SEC"
printf "\e[${bg_val_names};${font_val_names}mIP = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$IP"
printf "\e[${bg_val_names};${font_val_names}mMASK = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$MASK"
printf "\e[${bg_val_names};${font_val_names}mGATEWAY = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$GATEWAY"
printf "\e[${bg_val_names};${font_val_names}mRAM_TOTAL = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$RAM_TOTAL"
printf "\e[${bg_val_names};${font_val_names}mRAM_USED = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$RAM_USED"
printf "\e[${bg_val_names};${font_val_names}mRAM_FREE= \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$RAM_FREE"
printf "\e[${bg_val_names};${font_val_names}mSPACE_ROOT = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$SPACE_ROOT"
printf "\e[${bg_val_names};${font_val_names}mSPACE_ROOT_USED = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$SPACE_ROOT_USED"
printf "\e[${bg_val_names};${font_val_names}mSPACE_ROOT_FREE = \e[0m\e[${bg_vals};${font_vals}m%s\e[0m\n" "$SPACE_ROOT_FREE"
