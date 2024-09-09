# The main MTA process

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
