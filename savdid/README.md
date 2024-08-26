# Sophos Anti-Virus

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

To build a container image, simply clone the repository to your machine and from inside the `halon-docker/savdid` directory run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t halon/savdid:3.85.1 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             --platform=linux/amd64 \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind                  | Name         | Description                                                                                                     |
--------------------- | ------------ | --------------------------------------------------------------------------------------------------------------- |
ConfigMap             | `savdid`     | The configuration file                                                                                          |
ConfigMap             | `vdbs`       | The shell script that is run to update the virus data, the URL must be substituted with the URL provided by us  |
StorageClass          | `halon-vdbs` | A storage class for the virus data                                                                              |
PersistentVolume      | `halon-vdbs` | A persistent volume for the virus data, `path` and `nodeAffinity` must be adjusted to match your environment    |
PersistentVolumeClaim | `vdbs`       | A persistent volume claim for the virus data                                                                    |
ServiceAccount        | `vdbs`       | A service account for the cron job below                                                                        |
Role                  | `vdbs`       | A role for the service account above                                                                            |
RoleBinding           | `vdbs`       | A role binding for the service account above                                                                    |
CronJob               | `vdbs`       | The cron job that updates the virus data                                                                        |
Service               | `savdid`     | A regular service with a cluster IP listening on port `4010`                                                    |
Deployment            | `savdid`     | A regular deployment of a replica set                                                                           |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```
