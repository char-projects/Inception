#!/bin/bash
set -e

mkdir -p /var/www/html
cd /var/www/html
rm -rf *
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
mv wp-config-sample.php wp-config.php

DB_HOST=${DB_HOST:-mariadb}

sed -i "s/database_name_here/$DATABASE_NAME/g" wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
sed -i "s/localhost/$DB_HOST/g" wp-config.php

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
wp user create "$MYSQL_USER" "$MYSQL_USER_EMAIL" --user_pass="$MYSQL_PASSWORD" --role=author --allow-root

chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} +
find /var/www/html -type f -exec chmod 644 {} +

exec php-fpm8.2 -y /etc/php/8.2/fpm/php-fpm.conf -F