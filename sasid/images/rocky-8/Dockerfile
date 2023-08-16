FROM rockylinux:8
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN yum update -y && yum install -y epel-release

RUN echo "[halon]" >> /etc/yum.repos.d/Halon.repo
RUN echo "name=Halon repository" >> /etc/yum.repos.d/Halon.repo
RUN echo "baseurl=https://${HALON_REPO_USER}:${HALON_REPO_PASS}@repo.halon.io/dists/rhel8/amd64/stable" >> /etc/yum.repos.d/Halon.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/Halon.repo
RUN echo "gpgkey=https://raw.githubusercontent.com/halon/pgp-keys/master/pgp-keys/7F0A73B5.asc" >> /etc/yum.repos.d/Halon.repo
RUN echo "enabled=1" >> /etc/yum.repos.d/Halon.repo
RUN yum install -y sasid-5.1.3

RUN groupadd -g 1000 sasid
RUN useradd -u 1000 -g 1000 sasid

RUN mkdir -p /var/sasid/data
RUN chown sasid:sasid /var/sasid/data
RUN chmod 750 /var/sasid/data
RUN mkdir -p /var/sasid/rsync
RUN chown sasid:sasid /var/sasid/rsync
RUN chmod 750 /var/sasid/rsync

CMD [ "/opt/sasid/bin/sasid", "-c", "/etc/sasid/sasid.conf" ]
