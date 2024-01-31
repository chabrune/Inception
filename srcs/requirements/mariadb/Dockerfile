FROM	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt install vim mariadb-server -y

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld

COPY	conf/my.cnf /etc/mysql/my.cnf
COPY	conf/entrypoint.sh /etc/mysql/entrypoint.sh

RUN	chmod +x /etc/mysql/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/etc/mysql/entrypoint.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]