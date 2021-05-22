#!/bin/bash

source unix/utils.sh

# API client
postman_choice=$(check_for_command postman "Postman")
if [[ "${postman_choice}" =~ ^(yes|y)$ ]]; then
  snap install postman
fi

insomnia_choice=$(check_for_command insomnia "Insomnia")
if [[ "${insomnia_choice}" =~ ^(yes|y)$ ]]; then
  snap install insomnia
fi