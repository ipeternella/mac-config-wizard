#!/bin/bash

source unix/utils.sh

# Runtime version manager
asdf_choice=$(check_for_command asdf "asdf")
if [[ "${asdf_choice}" =~ ^(yes|y)$ ]]; then
  brew install asdf
fi
