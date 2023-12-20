# portainer-farm-lab

# Overview

You can use this repo to install a home (or farm) lab with portainer agents, duplicati and docker.

# Prerequisites

In order to complete this guide, you will need the following:

- MacOS or Linux
- Visual Studio Code
- Ansible

# Deployment overview

This guide will walk you through the following steps:

1. Setup
    1. Fork this repo
    1. Configure your servers
1. Deployment
    1. Execute installation script
1. Operations
    1. Add your own apps

## Fork this repo

In addition to this repository containing all the resources you will use throughout this guide, your GitHub repository will be the single source for your infrastructure definitions.

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this `portainer-farm-lab` repo into your own GitHub repo.

## Configure your servers

In order to setup your farm servers, you need to create your inventory, so execute command below in repo root folder:

```sh
cp -R ./inventory/sample ./inventory/servers
```

1. To edit your list of hosts, you need to open file ./inventory/servers/hosts.ini. You can use Visual Studio Code for this task. Use ./inventory/sample/hosts.ini as an example for this file

## Execute installation script

1. Now it is time to install your home lab. To do so, execute command as below:

```sh
./bin/install.sh
```

## Add your own apps

1. Create a folder for your application [MyApp] in ./roles/docker/files

```sh
mkdir ./roles/docker/files/[MyApp]
```

1. Copy docker-compose.yaml file for [MyApp] to ./roles/docker/files/[MyApp]. You can create an file ".env" with environment variables to be used by [MyApp].

1. Edit install.yaml and add a new value for docker-compose variable following the example below:

```yaml
vars:
    docker_compose:
      - { path: "{{ dockerApps }}/duplicati/docker-compose.yaml" }
      - { path: "{{ dockerApps }}/portainer-agent/docker-compose.yaml" }
      - { path: "{{ dockerApps }}/[MyApp]/docker-compose.yaml" }
```

1. Execute installation script