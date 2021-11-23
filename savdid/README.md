# Sophos Anti-Virus

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
docker build -t savdid:2.6.0 -f images/ubuntu-20.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind                  | Name     | Description                                                                                                     |
--------------------- | -------- | --------------------------------------------------------------------------------------------------------------- |
ConfigMap             | `savdid` | The configuration file                                                                                          |
ConfigMap             | `vdbs`   | The shell script that is run to update the virus data, the URL must be substituted with the URL provided by us  |
StorageClass          | `vdbs`   | A storage class for the virus data                                                                              |
PersistentVolume      | `vdbs`   | A persistent volume for the virus data, `path` and `nodeAffinity` must be adjusted to match your environment    |
PersistentVolumeClaim | `vdbs`   | A persistent volume claim for the virus data                                                                    |
ServiceAccount        | `vdbs`   | A service account for the cron job below                                                                        |
Role                  | `vdbs`   | A role for the service account above                                                                            |
RoleBinding           | `vdbs`   | A role binding for the service account above                                                                    |
CronJob               | `vdbs`   | The cron job that updates the virus data                                                                        |
Service               | `savdid` | A regular service with a cluster IP listening on port `4010`                                                    |
Deployment            | `savdid` | A regular deployment of a replica set                                                                           |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```