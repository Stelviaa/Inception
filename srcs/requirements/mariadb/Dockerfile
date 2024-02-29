FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y
ENTRYPOINT ./conf/init.sh