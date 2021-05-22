#!/bin/bash

source unix/utils.sh

# Runtime version manager
asdf_choice=$(check_for_command asdf "asdf")
if [[ "${asdf_choice}" =~ ^(yes|y)$ ]]; then
  ASDF_VERSION=$(get_latest_tag "asdf-vm/asdf")
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$ASDF_VERSION"
  bash "$HOME"/.asdf/asdf.sh plugin add python
fi
