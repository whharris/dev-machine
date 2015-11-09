#!/usr/bin/env bash

# Usage: sudo ./boostrap-control-machine.sh

# OSX
# Install xcode, pip, and ansible

is_installed () {
  hash $1 2>/dev/null
}

is_installed_xcode () {
  xcode-select -p &>/dev/null
}

install_xcode_clt () {
  xcode-select --install 2>/dev/null
  echo "Run this script again after installing XCode command line tools"
  exit 0
}

install_pip () {
  sudo easy_install pip
}

install_ansible () {
  sudo pip install ansible
}

if ! is_installed_xcode; then
  install_xcode_clt
fi

if ! is_installed pip; then
  install_pip
fi

if ! is_installed ansible; then
  install_ansible
fi

install_dir=~/dev-machine
if [ -e $install_dir ]; then
  echo "$install_dir already exists. Exiting..."
  exit 1
fi

echo 'Cloning dev-machine repo. Follow the prompts.'
git clone https://github.com/whharris/dev-machine.git $install_dir
echo "Now: cd $install_dir && ./bootstrap.sh"
