#!/bin/bash

mkdir -p /etc/mysql
chown mysql:mysql /etc/mysql || true
chmod 644 /etc/mysql || true

INIT_FILE=/etc/mysql/init.sql

cat > "$INIT_FILE" <<EOF
CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME:-wordpress};
CREATE USER IF NOT EXISTS '${MYSQL_USER:-wp_user}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD:-wp_pass}';
GRANT ALL PRIVILEGES ON ${DATABASE_NAME:-wordpress}.* TO '${MYSQL_USER:-wp_user}'@'%';
CREATE USER IF NOT EXISTS '${WP_USER:-wp_admin}'@'%' IDENTIFIED BY '${WP_USER_PASS:-wp_admin_pass}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD:-root_pass}';
FLUSH PRIVILEGES;
EOF

chown mysql:mysql "$INIT_FILE" || true
chmod 644 "$INIT_FILE" || true

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld || true
chmod 775 /run/mysqld || true

if [ -z "$(ls -A /var/lib/mysql 2>/dev/null)" ]; then
	echo "Initializing MariaDB data directory"
	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
fi

exec /usr/sbin/mariadbd --user=mysql --datadir=/var/lib/mysql