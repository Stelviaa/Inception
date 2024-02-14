FROM debian:buster
RUN apt -y update
RUN apt -y upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
RUN mkdir -p /run/php/ && touch /run/php/php7.3-fpm.pid
RUN chmod 777 /etc/php/7.3/fpm/php-fpm.conf && chmod 777 /run/php/php7.3-fpm.pid
RUN echo "clear_env = no" >> /etc/php/7.3/fpm/php-fpm.conf
RUN echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf
WORKDIR /var/www/html/
COPY ./conf/auto_config.sh .
RUN chmod 777 ./auto_config.sh
ENTRYPOINT ./auto_config.sh