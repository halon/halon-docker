FROM ubuntu:18.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN apt-get update

RUN apt-get install -y wget gnupg
RUN apt-get install -y apt-transport-https

RUN wget -qO - https://raw.githubusercontent.com/halon/changelog/master/pgp-keys/7F0A73B5.asc | apt-key add -
RUN echo "deb https://repo.halon.io/ bionic stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y ctasd=5.5.1

RUN groupadd -g 1000 ctasd
RUN useradd -u 1000 -g 1000 ctasd
RUN mkdir /tmp/ctasd
RUN mkdir /tmp/ctasd/avdef
RUN chown ctasd:ctasd /tmp/ctasd
RUN chown ctasd:ctasd /tmp/ctasd/avdef

CMD [ "/opt/ctasd/bin/ctasd.bin", "-i", "-c", "/etc/ctasd/ctasd.conf" ]
