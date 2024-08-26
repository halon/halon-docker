# Web administration

## Prerequisites

Make sure you have created the `halon` namespace first.

```
kubectl create namespace halon
```

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                          |
| -------------- | -----------------------------------  |
| `ubuntu-22.04` | Ubuntu 22.04.1 LTS (Jammy Jellyfish) |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)     |
| `rocky-8`      | Rocky Linux 8                        |
| `centos-7`     | CentOS Linux 7                       |

To build a container image, simply run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t web:1.16.0 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             --platform=linux/amd64 \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind       | Name   | Description                                                            |
---------- | ------ | ---------------------------------------------------------------------- |
ConfigMap  | `web`  | The configuration file, the default user in `users` should be replaced |
Service    | `web`  | A regular service with a cluster IP listening on port `80`             |
Deployment | `web`  | A regular deployment of a replica set                                  |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```