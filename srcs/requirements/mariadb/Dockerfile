FROM debian:bookworm

<<<<<<< HEAD
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
=======
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_USER_EMAIL
ARG MYSQL_HOST
ARG MYSQL_ROOT_USER
ARG MYSQL_ROOT_PASSWORD
ARG DATABASE_NAME

ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_USER_EMAIL=${MYSQL_USER_EMAIL}
ENV MYSQL_HOST=${MYSQL_HOST}
ENV MYSQL_ROOT_USER=${MYSQL_ROOT_USER}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV DATABASE_NAME=${DATABASE_NAME}

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server
>>>>>>> parent of da2b635 (made localhost:443 work)

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/script.sh /etc/mysql/script.sh
RUN chown -R mysql:mysql /var/lib/mysql
RUN chmod +x /etc/mysql/script.sh
RUN chmod -R 0660 /var/lib/mysql

CMD ["/etc/mysql/script.sh"]