# Cyren IP Reputation

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                        |
| -------------- | ---------------------------------- |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)   |
| `ubuntu-18.04` | Ubuntu 18.04.6 LTS (Bionic Beaver) |
| `rocky-8`      | Rocky Linux 8                      |
| `centos-8`     | CentOS Linux 8                     |
| `centos-7`     | CentOS Linux 7                     |

To build a container image, simply run the below command, substituting `ubuntu-20.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t ctipd:4.01.0005.1 -f images/ubuntu-20.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind       | Name    | Description                                                                          |
---------- | ------- | ------------------------------------------------------------------------------------ |
ConfigMap  | `ctipd` | The configuration file, `LicenseKey` must be substituted with the key provided by us |
Service    | `ctipd` | A regular service with a cluster IP listening on port `8080`                         |
Deployment | `ctipd` | A regular deployment of a replica set                                                |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```