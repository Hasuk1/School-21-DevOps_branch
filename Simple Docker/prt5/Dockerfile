FROM nginx:latest
WORKDIR /home/
COPY server/nginx.conf /etc/nginx/nginx.conf
COPY server/server.c /home
COPY server/run.sh /home

RUN apt-get update; \
    apt-get upgrade; \
    apt-get install -y spawn-fcgi libfcgi-dev gcc; \
    rm -rf /var/lib/apt/lists/*; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/newgrp; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod u-s /bin/mount; \
    chmod g-s /usr/bin/wall; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /bin/umount;

USER nginx

HEALTHCHECK --interval=5m --timeout=3s CMD curl http://localhost/ || exit 1

ENTRYPOINT ["bash", "run.sh"]