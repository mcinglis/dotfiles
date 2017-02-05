#!/bin/bash


# This script has been tested on Fedora 25 Workstation x86_64. It is
# idempotent; it can be run multiple times without destroying anything.

# All identifiers located within this script should be prefixed with "rprov"
# (root provisioner), so that if this script is `source`d, there are unlikely
# to be any nameclashes. Modular shell scripts are possible - it just requires
# discipline!


############################################################
# DATA DEFINITIONS:
############################################################

RPROV_PACKAGES_REMOVE=(
    gnome-classic-session rhythmbox evolution shotwell
)

RPROV_PACKAGES_INSTALL=(
    # Development tooling:
    gcc rust cargo python3 git gitg tmux ctags vim vim-X11 ghex
    ruby rubygem-jekyll awscli
    eclipse eclipse-m2e-core eclipse-egit junit-javadoc
    java-1.8.0-openjdk{,-{src,javadoc,headless,demo,devel}}
    # System tooling:
    gnome-tweak-tool dconf-editor gnome-nettool deja-dup vinagre
    firewall-config pwgen xclip
    # Internet:
    transmission-gtk youtube-dl polari empathy chromium
    # Office:
    gnome-dictionary pdfmod gimp
    # Media:
    gnome-music gnome-sound-recorder soundconverter mpv ffmpeg gnome-photos
    gstreamer-plugins-{base,good,bad{,-free,-nonfree},ugly}
    gstreamer1-{libav,plugins-{base,good,bad-{free,nonfree},ugly}}
    # Games:
    gnome-chess gnome-sudoku gnome-mines iagno quadrapassel aisleriot
    # Fonts:
    adobe-source-{sans,serif,code}-pro-fonts mozilla-fira-{mono,sans}-fonts
    aajohan-comfortaa-fonts campivisivi-titillium-fonts
    levien-inconsolata-fonts lato-fonts aldusleaf-crimson-text-fonts
    dustin-dustismo-roman-fonts msimonson-anonymouspro-fonts
    julietaula-montserrat-fonts scholarsfonts-cardo-fonts
    terminus-fonts-console gdouros-avdira-fonts
    # Libraries
    python{2,3}-jinja2
)

declare -A RPROV_REPOSITORIES=(
    ["rpmfusion-free-release"]="https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release.noarch.rpm"
    ["rpmfusion-nonfree-release"]="https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release.noarch.rpm"
)


############################################################
# TOP-LEVEL FUNCTIONS:
############################################################

rprov_main() {
    if [[ "$(id -u)" != "0" ]]; then
        echo "You must be root to perform root provisioning."
        return 1
    fi
    printf "\nStarting root-provisioning of [$HOSTNAME].\n"
    rprov_update_packages
    rprov_remove_packages
    rprov_install_repos
    rprov_install_packages
    printf "\nCompleted root-provisioning of [$HOSTNAME].\n\n"
    return 0
}

rprov_update_packages() {
    rprov_log_stage "Updating packages"
    rprov_pkgman update
}

rprov_remove_packages() {
    rprov_log_stage "Removing unwanted packages"
    rprov_pkgman remove "${RPROV_PACKAGES_REMOVE[@]}" \
        |& grep -v -e "No match"
}

rprov_install_repos() {
    rprov_log_stage "Installing repositories"
    for repo_pkg in "${!RPROV_REPOSITORIES[@]}"; do
        if rprov_is_installed "$repo_pkg"; then
            echo "Repository '$repo_pkg' is already installed."
        else
            rprov_pkgman install "${RPROV_REPOSITORIES[$repo_pkg]}"
        fi
    done
}

rprov_install_packages() {
    rprov_log_stage "Installing packages"
    rprov_pkgman install "${RPROV_PACKAGES_INSTALL[@]}" \
        |& grep -v "already installed"
}


############################################################
# HELPER FUNCTIONS:
############################################################

rprov_pkgman() {
    dnf --assumeyes "$@"
}

rprov_is_installed() {
    local package_name="$1"
    dnf list installed "$package_name" 2>&1 >/dev/null
}

rprov_log_stage() {
    printf "\n"
    printf ":::::::::::::::::::::::::::::::::::::::::::\n"
    printf "::: $1\n"
    printf ":::::::::::::::::::::::::::::::::::::::::::\n"
}


############################################################
# SCRIPT EXECUTION:
############################################################

# If this isn't being `source`d, then run `main`:
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    set -o pipefail
    set -o nounset
    rprov_main "$@"
fi

