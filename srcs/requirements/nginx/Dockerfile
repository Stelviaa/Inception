
FROM debian:bullseye


RUN apt update -y && apt install nginx -y && apt install openssl

RUN openssl req -x509 -newkey rsa:2048 -sha256 -nodes -keyout \
/etc/nginx/sforesti.key -out /etc/nginx/sforesti.crt -subj "/C=FR/ST=France/L=Nice/O=42/OU=42Nice/CN=sforesti"

COPY ./conf/ /etc/nginx/conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]