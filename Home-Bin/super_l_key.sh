#!/bin/bash
# This resets the .Xmodmap that changes the CapsLock
# to the Windows Sper_L Key for Keybindings in WM's
###
# Sleepeyesvince - YT - https://www.youtube.com/watch?v=l5LJ9tO7G74
### -> Remap Keys on your Keyboard in Linux
# 1. Determine the keycode of the key you want to remap using this command:
# xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'

# 2. Press the key you want to remap to obtain the keycode:
# 135 Menu
# In this example, the keycode is "135" and the keysym is "Menu"

# 3. In a text editor, enter this line:
# keycode 135 = Super_R

# 4. Save the file in your home directory as:
# .Xmodmap
# (don't forget the dot "." at the beginning)

# 5. To apply changes, either reboot or run this command:
# xmodmap .Xmodmap

# Note that if you hotplug your keyboard by unplugging and plugging it back in, you will need to reapply the changes with the above command.
# If you want to add comments to your .Xmodmap file, pre-append with "!" instead of "#".

# Examples of other keysyms are shown here:
# https://wiki.archlinux.org/title/Xmodmap#Modifier_keys

# Other articles I referenced in the the video were:
# https://wiki.archlinux.org/title/Xmodmap
# https://wiki.archlinux.org/title/Keyboard_input#Identifying_keycodes_in_Xorg

xmodmap .Xmodmap
