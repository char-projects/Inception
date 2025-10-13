FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget php php-fpm php-mysql

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

COPY ./conf/php.conf /etc/php/8.2/fpm/pool.d/php.conf
RUN mkdir -p /var/run/php && chown -R www-data:www-data /var/run/php
RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz
RUN tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
CMD ["php-fpm8.2", "-F"]