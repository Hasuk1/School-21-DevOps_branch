#!/bin/bash
#brew install goodwithtech/r/dockle

docker stop prt5 && docker rm -f prt5; \
docker build . -t prt5:1.1 -f ./Dockerfile; \
docker run -d -p 80:81 -v "$(pwd)/../nginx/nginx.conf:/etc/nginx/nginx.conf" --name prt5 prt5:1.1

sleep 1

export DOCKER_CONTENT_TRUST=1
dockle --ignore CIS-DI-0010 -ak NGINX_GPGKEY prt5:1.1

printf "\e[0m\e[1;32m%s\e[0m\n" "Проверяем, что по localhost:80 доступна страничка написанного мини сервера"
curl localhost:80
printf "\e[0m\e[1;32m%s\e[0m\n" "Проверим, что теперь по localhost:80/status отдается страничка со статусом nginx"
curl localhost:80/status