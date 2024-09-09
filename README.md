# Halon containers

This repository contains instructions on how to build container images of our [Halon MTA](https://halon.io/product/) components as well as the [threat protection](https://halon.io/product/asav/) components we provide. It also includes sample configurations for deploying these container images on [K8s](https://kubernetes.io) (Kubernetes).

## Components

Below are the components we currently have instructions for.

### Halon MTA

| Component | Description                       | Instructions            |
| --------- | ----------------------------------| ----------------------- |
| `smtpd`   | The main MTA process              | [Link](smtpd/README.md) |
| `rated`   | Rate limiting implementation      | [Link](rated/README.md) |
| `dlpd`    | Data Loss Prevention (DLP) engine | [Link](dlpd/README.md)  |
| `api`     | HTTP/JSON API                     | [Link](api/README.md)   |
| `web`     | Web administration                | [Link](web/README.md)   |

### Threat protection

| Component | Description         | Instructions             |
| --------- | ------------------- | ------------------------ |
| `savdid`  | Sophos Anti-Virus   | [Link](savdid/README.md) |
| `sasid`   | Sophos Anti-spam    | [Link](sasid/README.md)  |

## Kubernetes / Helm

Below are the instructions for configuring and deploying the Helm charts.

### Configure

The `main/values.yaml` file contains most of the settings that can be configured.
Some additional settings can also be found in the `values.yaml` files inside each subfolder.

### Deploy

To deploy the Helm charts first build the images as described in each subfolder and then run the following commands:

```
helm dependency update main
helm install halon main --render-subchart-notes
```
