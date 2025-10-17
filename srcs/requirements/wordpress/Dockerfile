FROM debian:bookworm

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y wget php8.2 php8.2-fpm php8.2-mysql php8.2-cli php8.2-curl php8.2-xml php8.2-gd php8.2-mbstring curl sendmail php-mail mariadb-client && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

COPY srcs/requirements/wordpress/conf/php.conf /etc/php/8.2/fpm/pool.d/php.conf
COPY srcs/requirements/wordpress/tools/script.sh /script.sh
RUN chmod +x /script.sh

CMD ["/script.sh"]