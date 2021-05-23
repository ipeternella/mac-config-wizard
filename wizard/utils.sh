#!/bin/bash
#
# Utility functions for the wizard.

#######################################
# Asserts the user OS Kernel is supported.
# Globals:
#   SUPPORTED_UNIX_KERNELS - exported on wizard/settings.sh
# Arguments:
#   $1 - The actual user kernel name (given by uname -s)
# Returns:
#  0 if the OS is known and supported
#  1 if the OS is unknown and NOT supported
#######################################
assert_kernel_is_supported() {
  local -r kernel_name="$1"

  for supported_kernel in "${SUPPORTED_UNIX_KERNELS[@]}"
  do
      if [[ "${supported_kernel}" == "${kernel_name}" ]] ; then
          return 0
      fi
  done

  return 1
}

#######################################
# Asserts the user is the root of exits. If not root, exits the program.
# Globals:
#   fatal - log utility exported by wizard/log.sh
# Arguments:
#   None
#######################################
check_for_root() {
  # If we are not running as root we exit the program
  if [ "$(id -u)" != 0 ]; then
    fatal "ERROR: You must be root user to run this program"
  fi
}