FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade

RUN     apt-get install curl -y

RUN curl -L https://github.com/portainer/portainer/releases/download/2.9.3/portainer-2.9.3-linux-amd64.tar.gz -o /tmp/portainer.tar.gz \
    && tar xzf /tmp/portainer.tar.gz -C /opt \
    && rm /tmp/portainer.tar.gz

# Start Portainer
ENTRYPOINT ["/opt/portainer/portainer", "-H", "unix:///var/run/docker.sock"]