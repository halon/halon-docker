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
RUN yum install -y halon-dlpd-10.1.0

RUN /usr/bin/install -d /var/run/halon

RUN groupadd -g 2000 dlpd
RUN useradd -u 2000 -g 2000 dlpd
RUN chown dlpd:dlpd /var/spool/halon/
RUN chown dlpd:dlpd /var/spool/halon/tmp
RUN /usr/bin/install -d var/spool/halon/tmp/dlpd
RUN chown dlpd:dlpd /var/spool/halon/tmp/dlpd

CMD ["sh", "-c", "exec env LD_LIBRARY_PATH=/opt/halon/lib/dlpd/:$LD_LIBRARY_PATH /opt/halon/sbin/dlpd -f"]
