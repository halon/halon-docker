# The main MTA process

## Prerequisites

Make sure you have created the `halon` namespace first.

```
kubectl create namespace halon
```

Also make sure that you have built the [HTTP/JSON API](../api/README.md) container image first.

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                          |
| -------------- | -----------------------------------  |
| `ubuntu-22.04` | Ubuntu 22.04.1 LTS (Jammy Jellyfish) |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)     |
| `rocky-8`      | Rocky Linux 8                        |
| `centos-7`     | CentOS Linux 7                       |

To build a container image, simply clone the repository to your machine and from inside the `halon-docker/smtpd` directory run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t halon/smtpd:6.4.1 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             --platform=linux/amd64 \
             images/ubuntu-22.04
```

The `halon-extras-rate`, `halon-extras-dlp` and `halon-extras-sophos` packages can be removed from the container image if the `rated`, `dlpd`, `savdid` and `sasid` containers are not going to be deployed.

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind             | Name            | Description                                                                                                                           |
---------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
ConfigMap        | `smtpd`         | The configuration files, `plugins` can be removed if the `rated` and `dlpd` containers are not going to be deployed                   |
StorageClass     | `halon-spool`   | A storage class for the email queue spool                                                                                             |
PersistentVolume | `halon-spool-1` | A local PV for the email queue spool, `path` and `nodeAffinity` must be adjusted to match your environment                            |
PersistentVolume | `halon-spool-2` | A local PV for the email queue spool, `path` and `nodeAffinity` must be adjusted to match your environment                            |
PersistentVolume | `halon-spool-3` | A local PV for the email queue spool, `path` and `nodeAffinity` must be adjusted to match your environment                            |
Service          | `smtpd`         | A headless service listening on port `25` and `80` that in order to work correctly needs to be single-stack                           |
StatefulSet      | `smtpd`         | A stateful set where each pod automatically gets assigned it's own PV, see `halon-spool-1`, `halon-spool-2` and `halon-spool-3` above |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```
