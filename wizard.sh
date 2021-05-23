#!/bin/bash
#
# The main entry point of the wizard installer.

source "./wizard/settings.sh"  # exports definitions
source "./wizard/utils.sh"
source "./wizard/log.sh"
source "./wizard/cmd/apps.sh"
source "./wizard/cmd/help.sh"
source "./wizard/cmd/install.sh"

#######################################
# Entrypoint for the wizard installer.
# Globals:
#   All globals exported by settings.sh
# Arguments:
#   "$@" - all arguments passed to the main.sh script
#######################################
main() {
  local -r user_kernel="$(uname -s)"

  while getopts "hl" option; do
    case "$option" in
    h)
      help
      exit 0
      ;;
    l)
      list_applications "${user_kernel}"
      exit 0
      ;;
    *) 
      help
      exit 1 
      ;;
    esac
  done
    
  assert_kernel_is_supported "${user_kernel}"

  if [[ "$?" -eq 1 ]]; then # grabs last executed command status code
    fatal "Sorry, your OS kernel ${user_kernel} is not supported!"
  fi

  install_iterative "${user_kernel}"
}

main "$@"