FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y

RUN     apt-get install vsftpd -y

COPY  tools/ftp_config.sh  /ftp_config.sh

ENTRYPOINT ["bash", "/ftp_config.sh"]