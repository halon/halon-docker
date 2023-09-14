FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ bionic stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y halon=6.0.1 halon-extras-rate=1.1.0 halon-extras-dlp=1.1.0 halon-extras-sophos=1.1.0

RUN /usr/bin/install -d /var/run/halon
ENV LD_LIBRARY_PATH=/opt/halon/lib/:$LD_LIBRARY_PATH

RUN groupadd -g 1000 smtpd
RUN useradd -u 1000 -g 1000 smtpd
RUN chown smtpd:smtpd /var/spool/halon/
RUN chown smtpd:smtpd /var/spool/halon/tmp

CMD [ "/opt/halon/sbin/smtpd", "-f" ]
