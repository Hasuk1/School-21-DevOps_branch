#!/bin/bash

# docker stop prt4 && docker rm -f prt4; \
# docker build . -t prt4:latest -f Dockerfile; \
# docker run -d -p 80:81 -v "$(pwd)/../nginx/nginx.conf:/etc/nginx/nginx.conf" --name prt4 prt4:latest

# sleep 1

printf "\e[0m\e[1;32m%s\e[0m\n" "Проверяем, что по localhost:80 доступна страничка написанного мини сервера"
curl localhost:80
printf "\e[0m\e[1;32m%s\e[0m\n" "Проверим, что теперь по localhost:80/status отдается страничка со статусом nginx"
curl localhost:80/status
