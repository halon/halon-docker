# Halon containers

This repository contains instructions on how to build container images of our [Halon MTA](https://halon.io/product/) components as well as the [threat protection](https://halon.io/product/asav/) components we provide. It also includes sample configurations for deploying these container images on [K8s](https://kubernetes.io) (Kubernetes).

Below are the components we currently have instructions for.

## Halon MTA

| Component | Description                       | Instructions            |
| --------- | ----------------------------------| ----------------------- |
| `smtpd`   | The main MTA process              | [Link](smtpd/README.md) |
| `rated`   | Rate limiting implementation      | [Link](rated/README.md) |
| `dlpd`    | Data Loss Prevention (DLP) engine | [Link](dlpd/README.md)  |

## Threat protection

| Component | Description         | Instructions             |
| --------- | ------------------- | ------------------------ |
| `ctipd`   | Cyren IP Reputation | [Link](ctipd/README.md)  |
| `ctasd`   | Cyren Anti-Spam     | [Link](ctasd/README.md)  |
| `savdid`  | Sophos Anti-Virus   | [Link](savdid/README.md) |