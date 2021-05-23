#!/bin/bash
#
# Utility functions used by the wizard. Also, defines the supported OS Kernels 
# by the wizard.

export DARWIN_KERNEL=Darwin
export LINUX_KERNEL=Linux
export SUPPORTED_UNIX_KERNELS=("${LINUX_KERNEL}" "${DARWIN_KERNEL}")
export DARWIN_SCRIPT_PATH="./wizard/installs/unix/darwin/darwin.sh"
export LINUX_SCRIPT_PATH="./wizard/installs/unix/linux/linux.sh"