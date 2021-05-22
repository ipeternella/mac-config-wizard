#!/bin/bash

source unix/utils.sh

# Communication
slack_choice=$(check_for_command slack "Slack")
if [[ "${slack_choice}" =~ ^(yes|y)$ ]]; then
  brew install --cask slack
fi

zoom_client_choice=$(check_for_command zoom-client "Zoom Client")
if [[ "${zoom_client_choice}" =~ ^(yes|y)$ ]]; then
  brew install --cask zoom
fi
