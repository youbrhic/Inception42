FROM debian:bullseye

RUN apt update && apt install mariadb-server  -y 

RUN mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql 

COPY tools/mdb_config.sh /usr/bin/mdb_config.sh

RUN chmod +x /usr/bin/mdb_config.sh

ENTRYPOINT ["bash", "mdb_config.sh"]
