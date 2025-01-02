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
RUN yum install -y expurgate-spamd-4.51.0

RUN groupadd -g 2000 expurgate
RUN useradd -u 2000 -g 2000 expurgate

RUN mkdir -p /var/log/expurgate-spamd
RUN chown expurgate:expurgate /var/log/expurgate-spamd
RUN chmod 750 /var/log/expurgate-spamd

RUN mkdir -p /var/spool/expurgate-spamd
RUN chown expurgate:expurgate /var/spool/expurgate-spamd
RUN chmod 750 /var/spool/expurgate-spamd

CMD [ "/usr/bin/expurgate-spamd", "--no-daemonize", "--config", "/etc/expurgate-spamd/expurgate-spamd.conf" ]
