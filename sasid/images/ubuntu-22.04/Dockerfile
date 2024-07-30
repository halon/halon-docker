FROM ubuntu:22.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update && apt-get install -y wget gnupg
RUN apt-get update && apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ jammy stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y sasid=5.1.3

RUN groupadd -g 1000 sasid
RUN useradd -u 1000 -g 1000 sasid

RUN mkdir -p /var/sasid/data
RUN chown sasid:sasid /var/sasid/data
RUN chmod 750 /var/sasid/data
RUN mkdir -p /var/sasid/rsync
RUN chown sasid:sasid /var/sasid/rsync
RUN chmod 750 /var/sasid/rsync

CMD [ "/opt/sasid/bin/sasid", "-c", "/etc/sasid/sasid.conf" ]
