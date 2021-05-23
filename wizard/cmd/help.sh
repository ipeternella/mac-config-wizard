#!/bin/bash
#
# Help subcommand implementation.

#######################################
# Prints to stdout instructions about how to use the wizard installer.
# Globals:
#   info - logging fn exported on wizard/log.sh
# Arguments
#   None
#######################################
help() {
  info "
  Wizard is a command line tool that helps software engineers to configure
  new machines by guiding the installation of relevant apps.

  Usage: $(basename "$0") [options...]

  Options:
    -h: Displays help
    -l: Displays the available software that will be asked to be installed

  Currently, the following 'flavors' of Unix kernels are supported:

  - ${SUPPORTED_UNIX_KERNELS[*]}"
}