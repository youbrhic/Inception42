FROM debian:bullseye

RUN apt  update && apt  upgrade -y && apt  install curl -y

RUN apt install php php-fpm php-mysql mariadb-client wget -y

COPY tools/wp_config.sh /

RUN  chmod +x wp_config.sh

ENTRYPOINT [ "./wp_config.sh" ]