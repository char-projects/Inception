#!/bin/bash
set -e

mkdir -p /etc/mysql
chown mysql:mysql /etc/mysql || true
chmod 755 /etc/mysql || true

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld || true
chmod 755 /run/mysqld || true

cat > "/etc/mysql/init.sql" <<EOF
CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${MYSQL_USER}'@'%';
CREATE USER IF NOT EXISTS '${WP_USER}'@'%' IDENTIFIED BY '${WP_USER_PASS}';
GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${WP_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

chown mysql:mysql /etc/mysql/init.sql || true
chmod 644 /etc/mysql/init.sql || true

if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

exec /usr/sbin/mariadbd --user=mysql --datadir=/var/lib/mysql