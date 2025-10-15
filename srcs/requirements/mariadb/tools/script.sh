#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME ;" > mysql.pid
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> mysql.pid
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';" >> mysql.pid
echo "CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASS';" >> mysql.pid
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> mysql.pid
echo "FLUSH PRIVILEGES;" >> mysql.pid

mysql < mysql.pid

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld