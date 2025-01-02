FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update && apt-get install -y wget gnupg
RUN apt-get update && apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ noble stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y expurgate-spamd=4.51.0

RUN groupadd -g 2000 expurgate
RUN useradd -u 2000 -g 2000 expurgate

RUN mkdir -p /var/log/expurgate-spamd
RUN chown expurgate:expurgate /var/log/expurgate-spamd
RUN chmod 750 /var/log/expurgate-spamd

RUN mkdir -p /var/spool/expurgate-spamd
RUN chown expurgate:expurgate /var/spool/expurgate-spamd
RUN chmod 750 /var/spool/expurgate-spamd

CMD [ "/usr/bin/expurgate-spamd", "--no-daemonize", "--config", "/etc/expurgate-spamd/expurgate-spamd.conf" ]
