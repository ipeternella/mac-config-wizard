# Color variables
BOLD="$(tput bold 2>/dev/null || printf '')"
GREY="$(tput setaf 0 2>/dev/null || printf '')"
UNDERLINE="$(tput smul 2>/dev/null || printf '')"
RED="$(tput setaf 1 2>/dev/null || printf '')"
GREEN="$(tput setaf 2 2>/dev/null || printf '')"
YELLOW="$(tput setaf 3 2>/dev/null || printf '')"
BLUE="$(tput setaf 4 2>/dev/null || printf '')"
MAGENTA="$(tput setaf 5 2>/dev/null || printf '')"
NO_COLOR="$(tput sgr0 2>/dev/null || printf '')"

# Text formatters
info() {
  printf '%s\n' "${BOLD}${GREY}>${NO_COLOR} $*"
  printf ''
}

warning() {
  printf '%s\n' "${YELLOW}! $*${YELLOW}"
  printf ''
}

error() {
  printf '%s\n' "${RED}x $*${RED}" >&2
  printf ''
}

completed() {
  printf '%s\n' "${GREEN}✓${GREEN} $*"
  printf ''
}

blue() {
  printf '%s\n' "${BLUE} $*"
  printf ''
}

magenta() {
  printf '%s\n' "${MAGENTA} $*"
  printf ''
}

check_for_command() {
  if ! hash "$1" &>/dev/null; then
    local choice
    read -rp "Do you want to install $2? [y/n] " choice
    echo "$choice" | tr '[:upper:]' '[:lower:]'
  fi
}

# GitHub API
get_latest_release() {
    # Retrieves the latest release version of a github repository
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep -Po '"tag_name": "\K.*?(?=")'                            # Get tag line
}

get_latest_tag() {
    # Retrieves the latest version tag of a github repository
    curl "https://api.github.com/repos/$1/tags" |
      grep -Po '"name": "\K.*?(?=")' |
      head -1                          # Get first tag from GitHub api
}
