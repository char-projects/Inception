FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -m 2750 /var/log/mysql
RUN chown mysql /var/log/mysql

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod 755 /var/lib/mysql

COPY srcs/requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY srcs/requirements/mariadb/tools/script.sh /etc/mysql/script.sh
RUN chmod +x /etc/mysql/script.sh

CMD ["/etc/mysql/script.sh"]