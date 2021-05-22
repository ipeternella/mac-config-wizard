#!/bin/bash

source unix/utils.sh

# NodeJS
read -rp "Do you want to install NodeJS LTS? [y/n] " node_choice
if hash "asdf" &>/dev/null && [[ "${node_choice}" =~ ^(yes|y)$ ]]; then
  asdf plugin list | grep nodejs || asdf plugin add nodejs
  asdf install nodejs lts
fi
