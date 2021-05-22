#!/bin/bash

source unix/utils.sh

source utils.sh

# Cloud
aws_cli_choice=$(check_for_command aws "AWS CLI")
if [[ "${aws_cli_choice}" =~ ^(yes|y)$ ]]; then
  brew install awscli
  aws config
fi
