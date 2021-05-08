#!/bin/bash

source unix/utils.sh

# Base

curl_choice=$(check_for_command curl "cURL")
if [[ -z "$curl_choice" ]]; then
  :
elif [[ "${curl_choice,,}" =~ ^(yes|y)$ ]]; then
  info "installing cURL"
else
  error "For now you must install cURL to proceed! (ノಠ益ಠ)ノ彡┻━┻"
fi

git_choice=$(check_for_command git "git")
if [[ -z "$git_choice" ]]; then
  :
elif [[ "${git_choice,,}" =~ ^(yes|y)$ ]]; then
  info "installing git"
else
  error "For now you must install git to proceed! (ノಠ益ಠ)ノ彡┻━┻"
fi