# Rate limiting implementation

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                          |
| -------------- | -----------------------------------  |
| `ubuntu-22.04` | Ubuntu 22.04.1 LTS (Jammy Jellyfish) |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)     |
| `rocky-8`      | Rocky Linux 8                        |
| `centos-7`     | CentOS Linux 7                       |

To build a container image, simply clone the repository to your machine and from inside the `halon-docker/rated` directory run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t rated:6.3.1 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             --platform=linux/amd64 \
             .
```

## Kubernetes

Below are the objects that the [sample configuration](kubernetes.yaml) include.

Kind       | Name    | Description                                                                                                      |
---------- | ------- | ---------------------------------------------------------------------------------------------------------------- |
ConfigMap  | `rated` | The configuration files, `key` must be substituted with your own HMAC-SHA1 key                                  |
Service    | `rated` | A headless service listening on port `5002` and `13131` that in order to work correctly needs to be single-stack |
Deployment | `rated` | A regular deployment of a replica set                                                                            |

The objects can be applied using the below command.

```
kubectl apply -f kubernetes.yaml
```
