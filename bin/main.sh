#!/bin/bash
set -e

resolve_symlinks() {
  SOURCE="${BASH_SOURCE[0]}"

  while [ -L "$SOURCE" ]; do
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done

  SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
  PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

  export PROJECT_ROOT
}

resolve_symlinks

source $PROJECT_ROOT/lib/rpms.sh
source $PROJECT_ROOT/lib/strings.sh
source $PROJECT_ROOT/lib/validation.sh

check_packages

echo "Choose an option:"
options=(
  "Install RPM packages"
  "Install Flatpaks"
  # "Enable RPM Fusion"
  # "Install multimedia codecs"
  "Quit"
)

select opt in "${options[@]}"
do
  case $REPLY in
    1) install_rpms ;;
    2) install_flatpaks ;;
    3) break ;;
    *) echo "Invalid option. Try again." ;;
  esac
done
