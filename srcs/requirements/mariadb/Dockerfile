FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y \
    mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh
#puede que necesite un script para que esta carpeta se cree y se borre cuando haga falta

CMD ["./script.sh"]

#instalamos mariadb-server y ejecutamos mysqld
#mysqld utility runs the server process for mariadb (or smth like that)

#copiamos el archivo de configuracion 'nuestro' al container
#copiamos el script init.sl al container (para inicializar la base de datos y nuestro usuario)

#creamos la carpeta /run/mysqld