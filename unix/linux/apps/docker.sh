#!/bin/bash

source unix/utils.sh

# Docker
docker_choice=$(check_for_command docker "Docker")
if [[ "${docker_choice,,}" =~ ^(yes|y)$ ]]; then
  curl -fsSL https://get.docker.com -o get-docker.sh | bash get-docker.sh
  rm -rf get-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker "$USER"

  docker_machine_choice=$(check_for_command docker-machine "Docker Machine")
  if [[ "${docker_machine_choice,,}" =~ ^(yes|y)$ ]]; then
    DOCKER_MACHINE_VERSION=$(get_latest_release "docker/machine")
    curl -L "https://github.com/docker/machine/releases/download/${DOCKER_MACHINE_VERSION}/docker-machine-$(uname -s)-$(uname -m)" >/usr/local/bin/docker-machine
    sudo chmod +x /usr/local/bin/docker-machine
  fi
  docker_compose_choice=$(check_for_command docker-compose "Docker Compose")
  if [[ "${docker_compose_choice,,}" =~ ^(yes|y)$ ]]; then
    DOCKER_COMPOSE_VERSION=$(get_latest_release "docker/compose")
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" >/usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
  fi
fi
