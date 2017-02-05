#!/bin/bash


# This script has been tested on Fedora 25 Workstation x86_64. It is
# idempotent; it can be run multiple times without destroying anything.

# All identifiers located within this script should be prefixed with "uprov"
# (user provisioner), so that if this script is `source`d, there are unlikely
# to be any nameclashes. Modular shell scripts are possible - it just requires
# discipline!


############################################################
# DATA DEFINITIONS:
############################################################

declare -A UPROV_DCONF_SETTINGS=(
    ["/org/gnome/desktop/background/picture-uri"]="'file:///usr/share/backgrounds/gnome/adwaita-timed.xml'"
    ["/org/gnome/desktop/background/primary-color"]="'#3465a4'"
    ["/org/gnome/desktop/background/secondary-color"]="'#000000'"
    ["/org/gnome/desktop/input-sources/xkb-options"]="['caps:swapescape', 'compose:menu']"
    ["/org/gnome/desktop/interface/clock-format"]="'12h'"
    ["/org/gnome/desktop/interface/clock-show-date"]="true"
    ["/org/gnome/desktop/privacy/recent-files-max-age"]="30"
    ["/org/gnome/desktop/privacy/remove-old-temp-files"]="true"
    ["/org/gnome/desktop/privacy/remove-old-trash-files"]="true"
    ["/org/gnome/desktop/search-providers/disabled"]="['org.gnome.Boxes.desktop', 'org.gnome.Documents.desktop', 'gnome-calculator.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Software.desktop', 'org.gnome.Terminal.desktop']"
    ["/org/gnome/desktop/session/idle-delay"]="900"
    ["/org/gnome/desktop/wm/preferences/action-middle-click-titlebar"]="'minimize'"
    ["/org/gnome/nautilus/preferences/click-policy"]="'single'"
    ["/org/gnome/nautilus/preferences/show-create-link"]="true"
    ["/org/gnome/nautilus/preferences/sort-directories-first"]="true"
    ["/org/gnome/settings-daemon/plugins/power/idle-dim"]="false"
    ["/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-timeout"]="3600"
    ["/org/gnome/settings-daemon/plugins/power/sleep-inactive-ac-type"]="'nothing'"
    ["/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-timeout"]="1800"
    ["/org/gnome/settings-daemon/plugins/power/sleep-inactive-battery-type"]="'suspend'"
    ["/org/gnome/shell/enabled-extensions"]="@as []"
    ["/org/gnome/shell/favorite-apps"]="@as []"
    ["/org/gnome/shell/window-switcher/current-workspace-only"]="true"
    ["/org/gnome/terminal/legacy/default-show-menubar"]="false"
)


############################################################
# TOP-LEVEL FUNCTIONS:
############################################################

uprov_main() {
    printf "\nStarting user-provisioning of [$HOSTNAME] for [$USER].\n"
    uprov_write_dconf
    printf "\nCompleted user-provisioning of [$HOSTNAME] for [$USER].\n"
}

uprov_write_dconf() {
    uprov_log_stage "Writing dconf settings"
    for key in "${!UPROV_DCONF_SETTINGS[@]}"; do
        local value="${UPROV_DCONF_SETTINGS[$key]}"
        echo "Writing $key = $value"
        dconf write "$key" "$value"
    done
}


############################################################
# HELPER FUNCTIONS:
############################################################

uprov_log_stage() {
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
    uprov_main "$@"
fi

