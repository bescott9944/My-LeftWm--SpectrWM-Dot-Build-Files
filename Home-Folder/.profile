# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=/usr/bin/nano

# Turn off screen blanking
# ---------------------------------------------------------------
# Turn off screen blanking In Window Managers like SpectrWM
# that goes into the ~/.profile file. This will turn off all screensavors
# powermanager blanking the screen....
xset s off && xset -dpms && xset s noblank

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi

if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
