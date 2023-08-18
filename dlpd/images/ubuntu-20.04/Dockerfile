FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ focal stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y halon-dlpd=6.0.0

RUN /usr/bin/install -d /var/run/halon
ENV LD_LIBRARY_PATH=/opt/halon/lib/dlpd/:$LD_LIBRARY_PATH

RUN groupadd -g 1000 dlpd
RUN useradd -u 1000 -g 1000 dlpd
RUN chown dlpd:dlpd /var/spool/halon/
RUN chown dlpd:dlpd /var/spool/halon/tmp
RUN /usr/bin/install -d var/spool/halon/tmp/dlpd
RUN chown dlpd:dlpd /var/spool/halon/tmp/dlpd

CMD [ "/opt/halon/sbin/dlpd", "-f" ]
