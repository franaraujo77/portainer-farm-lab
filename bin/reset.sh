#!/bin/bash

ansible-playbook -i ./inventory/servers/hosts.ini reset.yml
