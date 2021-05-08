#!/bin/bash

source unix/utils.sh

# Android development utils

watchman_choice=$(check_for_command watchman "Watchman")
if [[ "${watchman_choice,,}" =~ ^(yes|y)$ ]]; then
  brew install watchman
fi

openjdk8_choice=$(check_for_command javac "Java Development Kit")
if [[ "${openjdk8_choice,,}" =~ ^(yes|y)$ ]]; then
  brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
fi

android_sdk_choice=$(check_for_command sdkmanager "Android SDK")
if [[ "${android_sdk_choice,,}" =~ ^(yes|y)$ ]]; then
  brew install android-sdk
  touch $HOME/.android_paths
  export ANDROID_HOME=~/Android/Sdk
  echo 'export ANDROID_HOME=~/Android/Sdk' >>$HOME/.android_paths
  export PATH=$PATH:$ANDROID_HOME/emulator
  echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >>$HOME/.android_paths
  export PATH=$PATH:$ANDROID_HOME/tools
  echo 'export PATH=$PATH:$ANDROID_HOME/tools' >>$HOME/.android_paths
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >>$HOME/.android_paths
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >>$HOME/.android_paths
  echo 'source .android_paths' >>$HOME/.zshrc
fi

if hash "advmanager" &>/dev/null; then
  android_29=$(advmanager list target | grep "android-29")
  if [[ -z "$android_29" ]]; then
    read -rp "Do you want to install platforms;android-29? [y/n] " android_29_choice
    if [[ "${android_29_choice,,}" =~ ^(yes|y)$ ]]; then
      sdkmanager "platform-tools" "platforms;android-29" "build-tools;28.0.3"
    fi
  fi
fi
