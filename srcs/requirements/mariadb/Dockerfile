FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/init.sh /usr/src/app/
RUN chmod +x /usr/src/app/init.sh
ENTRYPOINT /usr/src/app/init.sh
