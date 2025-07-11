#!/bin/bash

source $PROJECT_ROOT/lib/strings.sh

call_menu() {
  echo "🪬 Choose an option:"

  select opt in "${options[@]}"
  do
    case $REPLY in
      1) install_rpms ;;
      2) install_flatpaks ;;
      3) break ;;
      *) echo "Invalid option. Try again." ;;
    esac
  done
}