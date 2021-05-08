#!/bin/bash

################################################################################
#                                 Installer                                    #
#                                                                              #
# A shell installer to help quickly setup a machine with some developer tools. #
#                                                                              #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
help() {
  # Display Help
  echo "Add description of the script functions here."
  echo
  echo "Syntax: scriptTemplate [-h]"
  echo "options:"
  echo "h     Print this Help."
  echo
}

################################################################################
# Check for root.                                                              #
################################################################################
check_for_root() {
  # If we are not running as root we exit the program
  if [ "$(id -u)" != 0 ]; then
    echo "ERROR: You must be root user to run this program"
    exit
  fi
}

################################################################################

################################################################################
# Check OS.                                                              #
################################################################################
check_os() {
  # If we are not running as root we exit the program
  local uname_os
  uname_os="$(uname -s)"
  case "${uname_os}" in
  Linux*)
    MACHINE=Linux
    ;;
  Darwin*)
    MACHINE=Mac
    ;;
  CYGWIN*)
    MACHINE=Cygwin
    ;;
  MINGW*)
    MACHINE=MinGw
    ;;
  *)
    MACHINE="UNKNOWN:${uname_os}"
    ;;
  esac
}

################################################################################

################################################################################
# Check OS.                                                              #
################################################################################
list_applications() {
  case "${MACHINE}" in
  Linux*)
    printf '\n'
    printf '%s\n' "git"
    printf '%s\n' "docker"
    printf '%s\n' "docker-machine"
    printf '%s\n' "docker-compose"
    printf '%s\n' "microk8s"
    printf '%s\n' "aws-cli"
    ;;
  Darwin*)
    MACHINE=Mac
    printf '\n'
    printf '%s\n' "xcode-select"
    printf '%s\n' "brew"
    printf '%s\n' "git"
    printf '%s\n' "docker"
    printf '%s\n' "aws-cli"
    printf '%s\n' "watchman"
    printf '%s\n' "openjdk8"
    printf '%s\n' "android-sdk"
    ;;
  CYGWIN*)
    MACHINE=Cygwin
    ;;
  MINGW*)
    MACHINE=MinGw
    ;;
  *)
    MACHINE="UNKNOWN:${uname_os}"
    ;;
  esac
}

install_iterative() {
  case "${MACHINE}" in
  Linux*)
    snap login \
    && bash "unix/linux/linux.sh"
    ;;
  Darwin*)
    MACHINE=Mac
    bash "unix/mac/mac.sh"
    ;;
  CYGWIN*)
    MACHINE=Cygwin
    echo "Your OS is not supported yet!"
    ;;
  MINGW*)
    MACHINE=MinGw
    echo "Your OS is not supported yet!"
    ;;
  *)
    MACHINE="UNKNOWN:${uname_os}"
    echo "Your OS is not supported yet!"
    ;;
  esac
}

################################################################################

################################################################################
# Initialize variables                                                         #
################################################################################

OPTION=""
MACHINE=""

################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options

check_os
while getopts "hl" OPTION; do
  case $OPTION in
  h) # display Help
    help
    exit
    ;;
  l) # list available applications to install based on OS
    list_applications
    ;;
  \?) # incorrect option
    echo "ERROR: Invalid option"
    exit
    ;;
  esac
done

install_iterative