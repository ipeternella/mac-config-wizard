#!/bin/bash

source unix/utils.sh

# Cloud
aws_cli_choice=$(check_for_command aws "AWS CLI")
if [[ "${aws_cli_choice,,}" =~ ^(yes|y)$ ]]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf awscliv2.zip aws
  aws configure
fi
