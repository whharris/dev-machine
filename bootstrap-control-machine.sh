#!/usr/bin/env bash

# Usage: sudo ./boostrap-control-machine.sh

# OSX
# Install xcode, pip, ansible, homebrew, and git

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

install_homebrew () {
  echo 'Installing HomeBrew. Follow the prompts.'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_git () {
  brew install git
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

if ! is_installed brew; then
  install_homebrew
fi

if ! is_installed git; then # Now installed with Xcode. TODO: replace with modern version.
  install_git
fi

cd ~/ && git clone git@github.com:whharris/dev-machine.git
