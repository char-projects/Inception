FROM alpine:3.21

RUN apk add --no-cache mariadb-server

COPY ./tools/requirements/mariadb/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["bash", "/tmp/script.sh"]

CMD ["mysqld_safe"]