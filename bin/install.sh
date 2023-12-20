#!/bin/bash

printf "Installing...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/servers/hosts.ini install.yml
