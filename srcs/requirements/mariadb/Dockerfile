FROM alpine:3.21

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

COPY ./tools/script.sh .
RUN chmod +x /script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

ENTRYPOINT ["/bin/sh", "./script.sh"]