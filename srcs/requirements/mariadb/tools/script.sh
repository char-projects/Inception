#!/bin/bash

MYSQL_ROOT_USER="${MYSQL_ROOT_USER:-root}"
MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-}"
DATABASE_NAME="${DATABASE_NAME:-}"
MYSQL_USER="${MYSQL_USER:-}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-}"

service mariadb start && \
    echo "CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME} ;" > maria.sql && \
    echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> maria.sql && \
    echo "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' ;" >> maria.sql && \
    echo "FLUSH PRIVILEGES;" >> maria.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> maria.sql && \
    mariadb < maria.sql