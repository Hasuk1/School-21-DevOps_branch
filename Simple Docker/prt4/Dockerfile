FROM nginx:latest

COPY server/nginx.conf /etc/nginx/nginx.conf
COPY server/server.c /
COPY server/run.sh /

RUN apt-get update; \
    apt-get upgrade; \
    apt-get install -y spawn-fcgi libfcgi-dev gcc; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bash", "run.sh"]