#!/usr/bin/env bash

# ArchLinux only
# pacman --noconfirm -Syu python2

sudo ansible-galaxy install --force -r roles.txt
ansible-playbook playbook.yml -i inventory --ask-sudo-pass
