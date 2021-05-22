#!/bin/bash

source unix/utils.sh

# Docker
docker_choice=$(check_for_command docker "Docker for Mac")
if [[ "${docker_choice}" =~ ^(yes|y)$ ]]; then
  brew install --cask docker
fi
