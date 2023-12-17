FROM debian:buster

RUN apt update -y && apt-get upgrade -y

RUN apt-get install -y wget

RUN apt-get install -y php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client \

RUN wget -P /var/www https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz 

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress
