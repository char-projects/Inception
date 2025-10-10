#!/bin/bash
/etc/init.d/mariadb start

/usr/bin/mariadb -u${mysql_root_user} -p${mysql_root_password} -e "CREATE DATABASE IF NOT EXISTS ${database_name};"
/usr/bin/mariadb -u${mysql_root_user} -p${mysql_root_password} -e "CREATE USER '${mysql_user}'@'%' IDENTIFIED BY '${mysql_password}';"
/usr/bin/mariadb -u${mysql_root_user} -p${mysql_root_password} -e "GRANT ALL PRIVILEGES ON ${database_name}.* TO '${mysql_user}'@'%';"
/usr/bin/mariadb -u${mysql_root_user} -p${mysql_root_password} -e "ALTER USER '${mysql_root_user}'@'localhost' IDENTIFIED BY '${mysql_root_password}';"
/usr/bin/mariadb -u${mysql_root_user} -p${mysql_root_password} -e "FLUSH PRIVILEGES;"
/usr/bin/mariadb-admin -u${mysql_root_user} -p${mysql_root_password} shutdown

exec "$@"