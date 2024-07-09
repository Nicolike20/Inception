FROM debian:bullseye

RUN apk update && apk upgrade && apk add --no-cache \
	mariadb mariadb-client mariadb-common && \
	rm -rf /var/cache/apk/*

COPY ./tools/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh

CMD ["sh", "/tmp/run.sh"]
#RUN apt update && apt upgrade -y && apt install -y \
#    mariadb-server

#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
#COPY ./tools/init.sql /etc/mysql/init.sql
#COPY ./tools/run.sh .

#RUN mkdir /run/mysqld && chmod +x run.sh
#esto es necesario?

#CMD ["./run.sh"]

#instalamos mariadb-server y ejecutamos mysqld
#mysqld utility runs the server process for mariadb (or smth like that)

#copiamos el archivo de configuracion 'nuestro' al container
#copiamos el script init.sl al container (para inicializar la base de datos y nuestro usuario)

#creamos la carpeta /run/mysqld

#damos permisos de ejecucion al script y lo ejecutamos