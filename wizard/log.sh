#!/bin/bash
#
# Logging functions.

#######################################
# Echoes the arguments to stdout.
# Globals:
#   None
# Arguments:
#   $* - Any arguments passed to the function.
#######################################
info() {
    echo "$*"
}

#######################################
# Echoes the arguments to stdout in a yellow collor to
# display warnings to the user.
# Globals:
#   None
# Arguments:
#   $* - Any arguments passed to the function.
#######################################
warning() {
    tput setaf 3
    echo "$*"
    tput init
}

#######################################
# Echoes the arguments to stdout in a red color to
# display errors to the user.
# Globals:
#   None
# Arguments:
#   $* - Any arguments passed to the function.
#######################################
err() {
    tput setaf 1
    echo "$*" >&2
    tput init
}

#######################################
# Echoes the arguments to stdout in a red color and
# exits the process with exit code 1.
# Globals:
#   None
# Arguments:
#   $* - Any arguments passed to the function.
#######################################
fatal() {
    tput setaf 1
    echo "$*" >&2
    exit 1
}