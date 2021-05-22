#!/bin/bash

source unix/utils.sh

# Base
xcode_choice=$(check_for_command xcode-select "Xcode select")

if [[ "${xcode_choice}" =~ ^(yes|y)$ ]]; then
  xcode-select --install
elif test -z "${xcode_choice}"; then
  :
else
  error "For now you must install xcode (ノಠ益ಠ)ノ彡┻━┻༽"
fi

brew_choice=$(check_for_command brew "Brew")
if [[ "${brew_choice}" =~ ^(yes|y)$ ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew doctor
  brew update
elif test -z "${xcode_choice}"; then
  :
else
  error "For now you must install brew as a package manager (ノಠ益ಠ)ノ彡┻━┻༽"
fi

curl_choice=$(check_for_command curl "cURL")
if [[ "${curl_choice}" =~ ^(yes|y)$ ]]; then
  brew install curl
fi

git_choice=$(check_for_command git "git")
if [[ "${git_choice}" =~ ^(yes|y)$ ]]; then
  brew install git
fi