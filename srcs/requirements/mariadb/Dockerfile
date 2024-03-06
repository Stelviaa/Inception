FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server mariadb-client -y
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init.sh /
RUN chmod +x /init.sh
ENTRYPOINT ["bash", "/init.sh"]