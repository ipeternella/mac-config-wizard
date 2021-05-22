#!/bin/bash

source unix/utils.sh

source utils.sh

# API client
postman_choice=$(check_for_command postman "Postman")
if [[ "${postman_choice}" =~ ^(yes|y)$ ]]; then
  brew install --cask postman
fi

insomnia_choice=$(check_for_command insomnia "Insomnia")
if [[ "${insomnia_choice}" =~ ^(yes|y)$ ]]; then
  brew install --cask insomnia
fi
