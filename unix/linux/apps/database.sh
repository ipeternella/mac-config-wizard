#!/bin/bash

source unix/utils.sh

# Database
dbeaver_ce_choice=$(check_for_command code "DBeaver CE")
if [[ "${dbeaver_ce_choice,,}" =~ ^(yes|y)$ ]]; then
  snap install dbeaver-ce
fi