FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    nginx && apt install -y openssl

RUN mkdir -p etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SP/ST=Madrid/L=Madrid/0=42/OU=IT/CN=nortolan.42.fr/"

RUN mkdir -p /var/run/nginx
COPY ./conf/default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]

#instalamos nginx con apt y lo ejecutamos en el foreground
#run openssl para crear las claves necesarias para la encriptacion TLS
# las primeras opciones son para indicar donde guardar la clave y la ultima para rellenar infomacion necesaria para el certificado
#el daemon off es para que no se salga bruscamente (que se mantenga en el foreground)
#copiamos el archivo de configuracion 'nuestro' dentro del container
#montamos un volumen en la carpeta web con los contenidos de /ver/www/html del container (compartido con el container de wordpress y php)
 