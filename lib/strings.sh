#!/bin/bash

# Namespace:
divider="\n•☽──────✧⋆⋅♡⋅⋆✧──────☾•\n"
cancellation="\033[1m🪦 Installation cancelled.\033[0m"
packages_file="$PROJECT_ROOT/data/packages.json"
options=(
  "Install RPM packages"
  "Install Flatpaks"
  # "Enable RPM Fusion"
  # "Install multimedia codecs"
  "Quit"
)
