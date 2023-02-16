# Kubetools

<p align="center">
    <img src="assets/images/logo.png"/>
</p>

Useful aliases and scripts for kubernetes which simplify routine operations.

## Installation

To install the toolkit, execute the following command, which will clone the repo to your home directory and update `.bashrc` file. For more details see [setup.sh](setup.sh):

```sh
curl -Ls https://cutt.ly/setup-kubetools | bash
```

To apply changes to your current terminal session execute the following command:

```sh
. ~/.bashrc
```

## Examples

The following command allows to get into the first pod and execute a curl command inside it:

```sh
kle $(klgpn | head -n 1) curl -s localhost:8080
```
