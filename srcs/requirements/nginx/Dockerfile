
FROM debian:buster


RUN apt update -y && apt upgrade -y && apt install nginx -y && apt install openssl

RUN openssl req -x509 -newkey rsa:2048 -sha256 -nodes -keyout \
/etc/nginx/sforesti.key -out /etc/nginx/sforesti.crt -subj "/C=FR/ST=France/L=Nice/O=42/OU=42Nice/CN=sforesti"

RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/conf/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]