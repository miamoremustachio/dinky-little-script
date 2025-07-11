#!/bin/bash

source $PROJECT_ROOT/lib/menu.sh
source $PROJECT_ROOT/lib/strings.sh
source $PROJECT_ROOT/lib/validation.sh

install_flatpaks() {
  check_sources_file
  check_jq

  echo "📜 List of Flatpak apps:"
  jq -r '.flatpaks[] | "* \(.name) (\(.id))"' "$APP_SOURCES"
  echo -e "$divider"

  jq -c '.flatpaks[]' $APP_SOURCES | while read -r app; do
    remote=$(echo "$app" | jq -r '.remote')
    id=$(echo "$app" | jq -r '.id')

    flatpak install --system "$remote" "$id"
  done

  repeat_question
}

repeat_question() {
  echo -e "$divider"
  echo -e "🐍 Would you like to do something else? \n"

  call_menu
}
