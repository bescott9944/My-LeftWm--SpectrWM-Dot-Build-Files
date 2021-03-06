#!/usr/bin/env bash
#
# Script name: dmsounds
# Description: Choose a ambient background sound to play
# Dependencies: dmenu, mpv
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# License: https://www.gitlab.com/dwt1/dmscripts/LICENSE
# Contributors: Derek Taylor
#
# Need some ambient sound files?  Here are is a collection
# of 15 free to use sounds for personal or commercial projects:
# http://pbblogassets.s3.amazonaws.com/uploads/2016/09/15-Free-Ambient-Sound-Effects.zip

# Set with the flags "-e", "-u","-o pipefail" cause the script to fail
# if certain things happen, which is a good thing.  Otherwise, we can
# get hidden bugs that are hard to discover.
set -euo pipefail

# The directory where the sound files are located.
# soundDir=$HOME/Music/Cornerstone
soundDir=$HOME/Music/Ambient-Sound-Effects
# Produces a listing of the sound files.
soundFiles=$(/bin/ls -1 "$soundDir" | grep ".mp3")

# An array of options to choose.
declare -a options=(
  "Choose sound file"
  "Play random sound"
  "Stop sound player"
  "Quit"
)

# An array of sound files to choose.
declare -a soundList=$soundFiles

# Piping the options array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | dmenu -b -i -p 'Ambient sounds:' "${@}")

# If user chooses a sound file.
if [ "$choice" == "Choose sound file" ]; then
  # Piping the soundList array into dmenu.
  # We use "printf '%s\n'" to format the array one item to a line.
  choice=$(printf '%s\n' "${soundList[@]}" | sort | dmenu -b -i -l 20 -p 'Choose sound file:' "$@")
  mpv --loop "$soundDir/$choice" || exit

# If user chooses to play a random sound.
elif [ "$choice" == "Play random sound" ]; then
  getRand=$(printf '%s\n' "${soundList[@]}" | shuf -n 1)
  mpv --loop "$soundDir/$getRand" || exit

# If user chooses to stop sound playing.
elif [ "$choice" == "Stop sound player" ]; then
  killall mpv

# What to do if we just escape without choosing anything.
else
  echo "Program terminated." && exit 0
fi
