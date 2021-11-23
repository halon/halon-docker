FROM rockylinux/rockylinux:8
LABEL org.opencontainers.image.authors="support@halon.io"

ARG HALON_REPO_USER
ARG HALON_REPO_PASS

RUN yum update -y && yum install -y epel-release

RUN echo "[halon]" >> /etc/yum.repos.d/Halon.repo
RUN echo "name=Halon repository" >> /etc/yum.repos.d/Halon.repo
RUN echo "baseurl=https://${HALON_REPO_USER}:${HALON_REPO_PASS}@repo.halon.io/dists/rhel8/amd64/stable" >> /etc/yum.repos.d/Halon.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/Halon.repo
RUN echo "gpgkey=https://raw.githubusercontent.com/halon/changelog/master/pgp-keys/7F0A73B5.asc" >> /etc/yum.repos.d/Halon.repo
RUN echo "enabled=1" >> /etc/yum.repos.d/Halon.repo
RUN yum install -y savdid-2.6.0

RUN echo "[kubernetes]" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "name=Kubernetes" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "enabled=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "repo_gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo
RUN echo "gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" >> /etc/yum.repos.d/kubernetes.repo
RUN yum install -y kubectl

RUN yum install -y wget zip

RUN groupadd -g 1000 savdid
RUN useradd -u 1000 -g 1000 savdid

CMD [ "/opt/savdid/bin/savdid", "-c", "/usr/local/savdi/savdid.conf" ]
