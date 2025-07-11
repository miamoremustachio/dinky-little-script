#!/bin/bash

source $PROJECT_ROOT/lib/strings.sh

call_menu() {
  echo "🪬 Choose an option:"

  select opt in "${options[@]}"
  do
    case $REPLY in
      1) install_packages ;;
      2) install_flatpaks ;;
      3) exit 0 ;;
      *) echo "Invalid option. Try again." ;;
    esac
  done
}