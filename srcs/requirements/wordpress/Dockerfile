FROM debian:bookworm

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget php8.2 php8.2-fpm php8.2-mysql php8.2-cli php8.2-curl php8.2-xml php8.2-gd php8.2-mbstring curl sendmail php-mail && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN echo "<html><body><h1>It works!</h1></body></html>" > /var/www/html/index.html

COPY ./conf/php.conf /etc/php/8.2/fpm/pool.d/php.conf
RUN mkdir -p /var/run/php && chown -R www-data:www-data /var/run/php

COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]