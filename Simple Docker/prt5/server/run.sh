#!/bin/bash
gcc server.c -o server.fcgi -lfcgi
spawn-fcgi -p 8080 ./server.fcgi
nginx -s reload
nginx -g 'daemon off;'