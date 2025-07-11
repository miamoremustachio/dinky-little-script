#!/bin/bash

source $PROJECT_ROOT/lib/strings.sh

check_packages() {
  if [[ ! -f "$packages_file" ]]; then
    echo >&2 "🌹 '$packages_file': file not found."
    echo -e "$cancellation"
    exit 1
  fi
}

check_jq() {
  command -v jq >/dev/null 2>&1 || {
    echo -e "🔮 This script requires the jq package to run.\n"

    read -p "Do you want to install it? [Y/n] " answer
    if [[ "$answer" =~ ^[Yy]$ || -z "$answer" ]]; then
      echo -e "$divider"
      sudo dnf install jq
    else
      echo -e "$cancellation"
      exit 1
    fi
  }
}