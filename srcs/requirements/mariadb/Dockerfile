FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -m 2750 /var/log/mysql
RUN chown mysql /var/log/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /etc/mysql/script.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod +x /etc/mysql/script.sh
RUN find /var/lib/mysql -type d -exec chmod 750 {} + || true
RUN find /var/lib/mysql -type f -exec chmod 640 {} + || true

CMD ["/etc/mysql/script.sh"]