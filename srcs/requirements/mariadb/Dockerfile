FROM debian:buster

RUN apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY ./conf/50-server.conf /etc/mysql/mariadb.cond.d/50-server.cnf

RUN ./init.sh