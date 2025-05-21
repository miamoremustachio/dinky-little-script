#!/bin/bash

source $PROJECT_ROOT/lib/validation.sh

install_rpms() {
  check_jq

  packages=($(jq -r '.rpm[]' $packages_file))

  echo "📦 List of packages:"
  printf ' * %s\n' "${packages[@]}"
  echo -e "$divider"

  sudo dnf install "${packages[@]}"
}
