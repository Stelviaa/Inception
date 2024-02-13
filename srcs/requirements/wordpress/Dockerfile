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
RUN echo "clear_env = no" >> /etc/php/7.3/fpm/php-fpm.conf
RUN echo "listen=wordpress:9000" >> /etc/php/7.3/fpm/php-fpm.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/auto_config.sh /usr/src/app/auto_config.sh
RUN chmod +x /usr/src/app/auto_config.sh
ENTRYPOINT /usr/src/app/auto_config.sh