#!/bin/bash

HOSTNAME=$(hostname)
USER=$(whoami)
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime -p | awk -F'up ' '{print $2}')
UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
IP=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1)
MASK=$(ifconfig | grep -w 'inet' | awk '{print $4}' | head -n 1)
GATEWAY=$(ip route | awk '/default/ {print $3}')
RAM_TOTAL=$(free -h --total | awk '/^Mem:/ {printf "%.3f GB\n", $2}')
RAM_USED=$(free -h --total | awk '/^Mem:/ {printf "%.3f GB\n", $3 / 1024}')
RAM_FREE=$(free -h --total | awk '/^Mem:/ {printf "%.3f GB\n", $4 / 1024}')
SPACE_ROOT=$(df -h / | awk '/\// {printf "%.2f MB\n", $2 * 1024}')
SPACE_ROOT_USED=$(df -h / | awk '/\// {printf "%.2f MB\n", $3 * 1024}')
SPACE_ROOT_FREE=$(df -h / | awk '/\// {printf "%.2f MB\n", $4 * 1024}')

function cur_timezone() {
  local timezone=$(timedatectl show --property=Timezone --value)
  local offset=$(date +"%-:z" | sed 's/:[0-9]*$//')
  echo "${timezone} UTC ${offset}"
}

function cur_os_name() {
  if [ -f /etc/os-release ]; then
    source /etc/os-release
    echo "$PRETTY_NAME"
  elif [ -f /etc/redhat-release ]; then
    cat /etc/redhat-release
  elif [ -f /etc/lsb-release ]; then
    source /etc/lsb-release
    echo "$DISTRIB_DESCRIPTION"
  else
    echo "Unknown"
  fi
}
