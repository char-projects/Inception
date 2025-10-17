FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

COPY srcs/requirements/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=ES/ST=Malaga/L=Malaga/O=42/OU=42/CN=cschnath"

RUN cp /etc/nginx/ssl/nginx.crt /etc/nginx/ssl/inception.crt
RUN cp /etc/nginx/ssl/nginx.key /etc/nginx/ssl/inception.key
RUN mkdir -p /etc/ssl/certs /etc/ssl/private
RUN cp /etc/nginx/ssl/nginx.crt /etc/ssl/certs/localhost.crt
RUN cp /etc/nginx/ssl/nginx.key /etc/ssl/private/localhost.key

RUN chmod 600 /etc/nginx/ssl/nginx.key /etc/ssl/private/localhost.key
RUN chmod 644 /etc/nginx/ssl/nginx.crt /etc/nginx/ssl/inception.crt /etc/ssl/certs/localhost.crt
RUN chown -R www-data:www-data /etc/nginx/ssl

RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
RUN find /var/www/html -type d -exec chmod 755 {} \;
RUN find /var/www/html -type f -exec chmod 644 {} \;

CMD ["nginx", "-g", "daemon off;"]