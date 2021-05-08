#!/bin/bash

source unix/utils.sh

# Kubernetes
microk8s_choice=$(check_for_command microk8s "microk8s")
if [[ "${microk8s_choice,,}" =~ ^(yes|y)$ ]]; then
  snap install microk8s --classic
fi
