#!/bin/bash

ansible-playbook -i ./inventory/servers/hosts.ini reboot.yml
