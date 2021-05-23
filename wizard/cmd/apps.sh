#!/bin/bash
#
# List applications subcommand implentation.

#######################################
# Lists applications to be installed on the user OS.
# Globals:
#   LINUX_KERNEL, DARWIN_KERNEL, etc. - kernel names exported by wizard/settings.sh
#   fatal - logging fn exported by wizard/log.sh
# Arguments:
#   $1 - The user kernel name
#######################################
list_applications() {
  local user_kernel=$1

  case "${user_kernel}" in
  "${LINUX_KERNEL}"*)
    printf '\n'
    printf '%s\n' "git"
    printf '%s\n' "docker"
    printf '%s\n' "docker-machine"
    printf '%s\n' "docker-compose"
    printf '%s\n' "microk8s"
    printf '%s\n' "aws-cli"
    ;;
  "${DARWIN_KERNEL}"*)
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
  *)
    fatal "Sorry, your OS kernel ${user_kernel} is not supported!"
    exit 1
    ;;
  esac
}