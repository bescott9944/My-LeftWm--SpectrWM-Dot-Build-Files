#!/usr/bin/env bash
#
# Script name: dman
# Description: Search for a manpage or get a random one.
# Dependencies: dmenu, xargs
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Derek Taylor
#               Simon Ingelsson

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.

set -euo pipefail

# Defined variables, modify anything in quotes to your prefered software
DMEDITOR="xed"
DMBROWSER="brave"
DMBROWSER_SHOW=1
TERMINAL="st"
DMTERM="st -e"
SCROTDIR="${HOME}/Pictres/shots"
DMWALLPAPERDIR="${HOME}/Pictures/Wallpapers"
# LOCKER='slock'
NOTIFIER='notify-send'
#DMHUB_DIR="${HOME}/git"
soundDir="${HOME}/.config/dmscripts/dmsounds"


function get_config() {
  local loaded=0
  declare -a config_dirs=(
  "${HOME}/.config/dmscripts/config"
  "/etc/dmscripts/config"
  )
  for conf in "${config_dirs[@]}"; do
    if [[ -f ${conf} ]]; then
      echo "${conf}"
      loaded=1
      break
    fi
  done
  [[ ${loaded} -eq 0 ]] && echo "No config found" ; exit 1
}

# An array of options to choose.
declare -a dman_options=(
"Search manpages"
"Random manpage"
"Quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${dman_options[@]}" | dmenu -i -p 'Manpages:' "$@")

# What to do when/if we choose one of the options.
case "$choice" in
  'Search manpages')
        # shellcheck disable=SC2086

        man -k . | awk '{$3="-"; print $0}' | \
        dmenu -i -l 20 -p 'Search for:' | \
        awk '{print $2, $1}' | tr -d '()' | xargs $DMTERM man
  ;;
  'Random manpage')
        # shellcheck disable=SC2086
        man -k . | awk '{print $1}' | shuf -n 1 | \
        dmenu -i -l 20 -p 'Random manpage:' | xargs $DMTERM man
  ;;
  'Quit')
    echo "Program terminated." && exit 0
  ;;
  *)
    exit 0
  ;;
esac
