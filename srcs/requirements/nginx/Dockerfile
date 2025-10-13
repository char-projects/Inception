FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=ES/ST=Málaga/L=Málaga/O=42/OU=42/CN=cschnath"  
RUN chmod 600 /etc/nginx/ssl/nginx.key /etc/nginx/ssl/nginx.crt
RUN chown -R www-data:www-data /etc/nginx/ssl
RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN echo "<html><body><h1>It works!</h1></body></html>" > /var/www/html/index.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]