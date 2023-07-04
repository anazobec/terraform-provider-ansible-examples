#!/bin/sh

set -euxs

# Run playbook
ansible-playbook -i inventory.yml playbook.yml

# Check results
ip=$(ansible-inventory -i inventory.yml --list | jq -r '.nginx.hosts[0]')
curl "http://${ip}" --fail
