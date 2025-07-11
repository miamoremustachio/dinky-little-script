detect_distro() {
  [ -f /etc/os-release ]
   . /etc/os-release
    case "$ID" in
      arch)
        APP_SOURCES="$PROJECT_ROOT/data/sources_arch.json"
        PKG_INSTALL="pacman -S"
        PKG_UPDATE="pacman -Syu"
        DISTRO="Arch"
        ;;
      fedora)
        APP_SOURCES="$PROJECT_ROOT/data/sources_fedora.json"
        PKG_INSTALL="dnf install"
        PKG_UPDATE="dnf upgrade --refresh"
        DISTRO="Fedora"
        ;;
      *)
        echo "🐌 Sorry, your distro sucks, try Arch or Fedora instead of this hornswaddle."
        exit 1
        ;;
    esac
}
