FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /etc/mysql/script.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod +x /etc/mysql/script.sh
RUN chmod -R 0660 /var/lib/mysql

CMD ["/etc/mysql/script.sh"]