FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y procps

# copy the provided config file to the container
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/

# port sur lequel l application ecoute
EXPOSE 3306

COPY	./tools/dbscript.sh /usr/local/bin/dbscript.sh
RUN	chmod 755 /usr/local/bin/dbscript.sh

# commande a executer lors du demarrage
CMD ["/usr/local/bin/dbscript.sh"]