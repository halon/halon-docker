FROM ubuntu:20.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/changelog/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ focal stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y halon-rated=5.9.1

RUN /usr/bin/install -d /var/run/halon
ENV LD_LIBRARY_PATH=/opt/halon/lib/rated/:$LD_LIBRARY_PATH

RUN groupadd -g 1000 rated
RUN useradd -u 1000 -g 1000 rated

CMD [ "/opt/halon/sbin/rated", "-f" ]
