# Sophos Anti-Spam

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
docker build -t sasid:5.1.3 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind                  | Name    | Description                                                                                                                 |
--------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------- |
ConfigMap             | `sasid` | The configuration file                                                                                                      |
Service               | `sasid` | A regular service with a cluster IP listening on port `25315`                                                               |
Deployment            | `sasid` | A regular deployment of a replica set, `SASI_USER` and `SASI_PASSWORD` must be replaced with the credentials provided by us |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```