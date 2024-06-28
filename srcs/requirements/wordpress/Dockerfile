FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    php-fpm \
    php-mysqli \
    curl

RUN mkdir /var/run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./tools/script.sh .

RUN chmod +x script.sh

CMD ["./script.sh"]

#instalamos php y lo ejecutamos en el foreground
#copiamos el archivo de configuracion 'nuestro' dentro del container
#montamos un volumen en la carpeta web con los contenidos de /ver/www/html del container (compartido con el container de nginx)