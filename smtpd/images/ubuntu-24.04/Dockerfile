FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ENV HALON_REPO_USER=$HALON_REPO_USER
ARG HALON_REPO_PASS
ENV HALON_REPO_PASS=$HALON_REPO_PASS

RUN apt-get update && apt-get install -y wget gnupg
RUN apt-get update && apt-get install -y apt-transport-https

RUN wget -O- https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.gpg >> /usr/share/keyrings/halon-archive-keyring.gpg
RUN . /etc/lsb-release && echo "deb [arch=`dpkg --print-architecture` signed-by=/usr/share/keyrings/halon-archive-keyring.gpg] https://repo.halon.io/ $DISTRIB_CODENAME stable" >> /etc/apt/sources.list.d/halon.list
RUN echo "machine repo.halon.io login ${HALON_REPO_USER} password ${HALON_REPO_PASS}" >> /etc/apt/auth.conf
RUN apt-get update && apt-get install -y \
    halon=6.7.1 \
    halon-extras-k8s-hqfmove=1.0.0 \
    halon-extras-rate=1.2.1 \
    halon-extras-logger=1.3.1 \
    halon-extras-warmup=1.3.0 \
    halon-extras-arf=1.1.0 \
    halon-extras-dsn=1.0.0 \
    halon-extras-batv=1.0.0 \
    halon-extras-ulid=1.0.0 \
    halon-extras-backoff=1.13.0 \
    halon-extras-suppression-list=2.0.0 \
    halon-extras-bounce-list=2.0.1 \
    halon-extras-bounce-classifications=1.0.3 \
    halon-extras-backoff-classifications=1.0.1 \
    halon-extras-env=1.1.0 \
    halon-extras-http-bulk=1.6.3 \
    halon-extras-history-elastic=2.0.0 \
    halon-extras-tracking=1.1.2
    
RUN /usr/bin/install -d /var/run/halon

RUN groupadd -g 2000 smtpd
RUN useradd -u 2000 -g 2000 smtpd
RUN chown smtpd:smtpd /var/spool/halon/
RUN chown smtpd:smtpd /var/spool/halon/tmp

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD [ "/opt/halon/sbin/smtpd", "-f" ]
