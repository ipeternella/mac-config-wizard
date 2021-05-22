#!/bin/bash

################################################################################
# Imports                                                                      #
################################################################################
source unix/utils.sh
################################################################################

info "Starting the installation process for a Mac OS!"

MAC_APPS_PATH="unix/mac/apps"

source "$MAC_APPS_PATH/requirements.sh"

read -rp "Do you want to install Communication tools? [y/n] " communication_apps
if [[ "${communication_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/communication.sh"
fi

read -rp "Do you want to install Docker utilities? [y/n] " docker_apps
if [[ "${docker_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/docker.sh"
fi

read -rp "Do you want to install Kubernetes utilities? [y/n] " kubernetes_apps
if [[ "${kubernetes_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/kubernetes.sh"
fi

read -rp "Do you want to install Version Managers utilities? [y/n] " version_managers_apps
if [[ "${version_managers_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/version_managers.sh"
fi

read -rp "Do you want to install API Clients? [y/n] " api_client_apps
if [[ "${api_client_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/api_client.sh"
fi

read -rp "Do you want to install Android Emulator utilities? [y/n] " android_apps
if [[ "${android_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/android_emulator.sh"
fi

read -rp "Do you want to install Code Editors? [y/n] " editors_apps
if [[ "${editors_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/editors.sh"
fi

read -rp "Do you want to install Database utilities? [y/n] " database_apps
if [[ "${database_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/database.sh"
fi

read -rp "Do you want to install Cloud utilities? [y/n] " cloud_apps
if [[ "${cloud_apps}" =~ ^(yes|y)$ ]]; then
  source "$MAC_APPS_PATH/cloud.sh"
fi
