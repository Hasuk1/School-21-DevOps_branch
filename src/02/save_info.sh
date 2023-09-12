#!/bin/bash

chmod +x print_info.sh

read -p "Save this information to a file? (Y/N) " choice

if [[ ${choice} =~ ^[Yy]$ ]]; then
  filename="$(date +'%d_%m_%y_%H_%M_%S').status"
  ./print_info.sh > "${filename}"
  echo "Information saved to file: ${filename}"
else
  echo "Information not saved"
fi
