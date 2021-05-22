#!/bin/bash

source unix/utils.sh

# Editors
vscode_choice=$(check_for_command code "VSCode")
if [[ "${vscode_choice}" =~ ^(yes|y)$ ]]; then
  snap install --classic code
fi

pycharm_pe_choice=$(check_for_command pycharm-professional "PyCharm Professional")
if [[ "${pycharm_pe_choice}" =~ ^(yes|y)$ ]]; then
  snap install pycharm-professional --classic
fi

if [[ "${pycharm_pe_choice}" =~ ^(no|n)$ ]]; then
  pycharm_ce_choice=$(check_for_command pycharm-community "PyCharm Community")
  if [[ "${pycharm_ce_choice}" =~ ^(yes|y)$ ]]; then
    snap install pycharm-ce --classic
  fi
fi

webstorm_choice=$(check_for_command webstorm "WebStorm")
if [[ "${webstorm_choice}" =~ ^(yes|y)$ ]]; then
  snap install webstorm --classic
fi