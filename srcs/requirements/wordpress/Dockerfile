FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.

CMD ["php-fpm8.2", "-F"]

#instalamos php y lo ejecutamos en el foreground
#copiamos el archivo de configuracion 'nuestro' dentro del container
#montamos un volumen en la carpeta web con los contenidos de /ver/www/html del container (compartido con el container de nginx)