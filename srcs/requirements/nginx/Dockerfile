FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key -subj \
"/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sforesti.42.fr/UID=sforesti"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN chmod 755 /var/www/html
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html
CMD [ "nginx", "-g", "daemon off;" ]