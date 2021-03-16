#!/bin/sh

if [ "$DESKTOP_SESSION" = "spectrwm" ]; then 
   sleep 20s
   killall conky
   cd "$HOME/.conky/UFP-Arch"
   conky -c "$HOME/.conky/UFP-Arch/UFP-Arch-Main-Net-lua-Fixed" &
   cd "$HOME/.conky/UFP-Arch"
   conky -c "$HOME/.conky/UFP-Arch/UFP-Soectrwm-Net-Port-Connection-lua-Fixed" &
   exit 0
fi
if [ "$DESKTOP_SESSION" = "cinnamon" ]; then 
   # No widgets enabled!
   exit 0
fi
if [ "$DESKTOP_SESSION" = "leftwm" ]; then 
   sleep 0s
   killall conky
   cd "$HOME/.conky/UFP-Arch"
   conky -c "$HOME/.conky/UFP-Arch/UFP-Soectrwm-Net-Port-Connection-lua-Fixed-LeftWm" &
   cd "$HOME/.conky/UFP-Arch"
   conky -c "$HOME/.conky/UFP-Arch/UFP-Arch-Main-Net-lua-Fixed-LeftWm" &
   exit 0
fi
#   conky -c "$HOME/.conky/UFP-Arch/UFP-Arch-Main-Net-lua-Fixed-LeftWm" &
#   cd "$HOME/.conky/UFP-Arch"
#   conky -c "$HOME/.conky/UFP-Arch/UFP-Soectrwm-Net-Port-Connection-lua-Fixed-LeftWm" &
