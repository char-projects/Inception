FROM debian:bookworm

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

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

RUN ./script.sh

CMD ["mysqld"]