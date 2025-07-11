#!/bin/bash

source $PROJECT_ROOT/lib/menu.sh
source $PROJECT_ROOT/lib/strings.sh
source $PROJECT_ROOT/lib/validation.sh

install_rpms() {
  check_packages
  check_jq

  packages=($(jq -r '.rpm[]' $packages_file))

  echo "📜 List of packages:"
  printf ' * %s\n' "${packages[@]}"
  echo -e "$divider"

  sudo dnf install "${packages[@]}"

  repeat_question
}

repeat_question() {
  echo -e "$divider"
  echo -e "🐍 Would you like to do something else? \n"

  call_menu
}
