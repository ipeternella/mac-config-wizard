#!/bin/bash
#
# Guides the user through a software installation journey.

#######################################
# Lists applications to be installed on the user OS.
# Globals:
#  $LINUX_KERNEL, $DARWIN_KERNEL, etc. - kernel names exported by wizard/settings.sh
#  info - logging fn exported by by wizard/log.sh
# Arguments:
#   "$1" - The user kernel name
#######################################
install_iterative() {
  local -r user_kernel="$1"

  case "${user_kernel}" in
  "${LINUX_KERNEL}"*)
    info "Installing linux apps..."
    ;;
  "${DARWIN_KERNEL}"*)
    info "Installing Darwin (macOS) apps..."
    ;;
  *)
    exit 1
  esac
}
