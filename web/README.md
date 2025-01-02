# Web administration

## Build

Below are the linux distributions we currently have instructions for.

| Distribution   | Description                          |
| -------------- | -----------------------------------  |
| `ubuntu-24.04` | Ubuntu 24.04.1 (Noble Numbat)        |
| `ubuntu-22.04` | Ubuntu 22.04.1 LTS (Jammy Jellyfish) |
| `rocky-8`      | Rocky Linux 8                        |

To build a container image, simply run the below command, substituting `ubuntu-24.04` with any of the distributions above and the example credentials with those provided by us.

```
docker build -t halon/web:1.18.0 -f images/ubuntu-24.04/Dockerfile \
             --build-arg HALON_REPO_USER=exampleuser \
             --build-arg HALON_REPO_PASS=examplepass \
             --platform=linux/amd64 \
             .
```
