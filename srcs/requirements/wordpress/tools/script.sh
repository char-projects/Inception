#!/bin/bash

if [ ! -f /var/www/html/index.html ]; then
    wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
    tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1
    chown -R www-data:www-data /var/www/html
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --path=/var/www/html --allow-root
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    sed -i "s/database_name_here/$DATABASE_NAME/g" /var/www/html/wp-config.php
    sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config.php
    sed -i "s/localhost/$MYSQL_HOST/g" /var/www/html/wp-config.php

    wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --path=/var/www/html --allow-root
    wp user create "$MYSQL_USER" "$MYSQL_USER_EMAIL" --user_pass="$MYSQL_PASSWORD" --role=author --path=/var/www/html --allow-root
fi

chown -R www-data:www-data /var/www/html && chmod -R 644 /var/www/html
php-fpm8.2 -y /etc/php/8.2/fpm/pool.d/php.conf -F