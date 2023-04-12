# HTTP/JSON API

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                        |
| -------------- | ---------------------------------- |
| `ubuntu-20.04` | Ubuntu 20.04.3 LTS (Focal Fossa)   |
| `ubuntu-18.04` | Ubuntu 18.04.6 LTS (Bionic Beaver) |
| `rocky-8`      | Rocky Linux 8                      |
| `centos-8`     | CentOS Linux 8                     |
| `centos-7`     | CentOS Linux 7                     |

To build a container image, simply run the below command, substituting `ubuntu-22.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t api:5.12.0 -f images/ubuntu-22.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             .
```

## Kubernetes

It should be deployed in the same pod as the `smtpd`, `rated` or `dlpd` containers rather than as a stand-alone pod.