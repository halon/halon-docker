# The main MTA process

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                          |
| -------------- | -----------------------------------  |
| `ubuntu-22.04` | Ubuntu 22.04.1 LTS (Jammy Jellyfish) |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)     |
| `ubuntu-18.04` | Ubuntu 18.04.6 LTS (Bionic Beaver)   |
| `rocky-8`      | Rocky Linux 8                        |
| `centos-7`     | CentOS Linux 7                       |

To build a container image, simply run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t smtpd:5.10.0 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             .
```

The `halon-extras-rate`, `halon-extras-dlp`, `halon-extras-cyren` and `halon-extras-sophos` packages can be removed from the container image if the `rated`, `dlpd`, `ctasd`, `ctipd`, `savdid` and `sasid` containers are not going to be deployed.

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind             | Name      | Description                                                                                                         |
---------------- | --------- | ------------------------------------------------------------------------------------------------------------------- |
ConfigMap        | `smtpd`   | The configuration files, `plugins` can be removed if the `rated` and `dlpd` containers are not going to be deployed |
StorageClass     | `spool`   | A storage class for the email queue spool                                                                           |
PersistentVolume | `spool-1` | A local PV for the email queue spool, `path` and `nodeAffinity` must be adjusted to match your environment          |
PersistentVolume | `spool-2` | A local PV for the email queue spool, `path` and `nodeAffinity` must be adjusted to match your environment          |
Service          | `smtpd`   | A headless service listening on port `25`                                                                           |
StatefulSet      | `smtpd`   | A stateful set where each pod automatically gets assigned it's own PV, see `spool-1` and `spool-2` above            |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```