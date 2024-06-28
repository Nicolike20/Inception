FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx

COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]

#instalamos nginx con apt y lo ejecutamos en el foreground
#el daemon off es para que no se salga bruscamente (que se mantenga en el foreground)
#copiamos el archivo de configuracion 'nuestro' dentro del container
#montamos un volumen en la carpeta web con los contenidos de /ver/www/html del container (compartido con el container de wordpress y php)