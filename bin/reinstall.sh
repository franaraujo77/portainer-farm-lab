#!/bin/bash

printf "Uninstalling...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/servers/hosts.ini reboot.yml

printf "Installing...\n"
printf "#######################################################\n\n"
ansible-playbook -i ./inventory/servers/hosts.ini install.yml
