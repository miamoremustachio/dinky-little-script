#!/bin/bash

# Namespace:
divider="\n•☽──────✧⋆⋅♡⋅⋆✧──────☾•\n"
cancellation="\033[1m🪦 Installation cancelled.\033[0m"

# Check the packages.json existence:
packages_file="./src/packages.json"

if [[ ! -f "$packages_file" ]]; then
  echo >&2 "🌹 '$packages_file': file not found."
  echo -e "$cancellation"
  exit 1
fi

echo -e "$divider"

# Check if jq is installed:
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

packages=($(jq -r '.dnf[]' $packages_file))

echo "📦 List of packages:"
printf ' * %s\n' "${packages[@]}"
echo -e "$divider"

sudo dnf install "${packages[@]}"
