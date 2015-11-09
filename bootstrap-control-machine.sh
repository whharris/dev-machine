#!/usr/bin/env bash

# Usage: sudo ./boostrap-control-machine.sh

# OSX
# Install pip and ansible

is_installed () {
  hash $1 2>/dev/null
}

install_pip () {
  easy_install pip
}

install_ansible () {
  pip install ansible
}

if ! is_installed pip; then
  install_pip
fi

if ! is_installed ansible; then
  install_ansible
fi

# Install galaxy roles
ansible-galaxy install --force -r roles.txt

