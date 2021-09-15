#!/bin/bash

# Copy music from a external drive to the Ubunti-serv v.1.0
# Were copying Eznix's music to the server...
# 01/17/2021 -Bruce E. Scott

# Starting synchronization:

clear
echo -e "Restoring /home/bruce"
echo -e "Starting Restore..."

sleep 8

  rsync -aAHXv --progress /run/media/bruce/XBT_Drive/XBT_Backups/EndeavourOS/Home_Backup/bruce \
  /home/bruce
echo -e "Music Sync Done"
 echo "Wait! Syncing drives..."
    sync
    echo "...Done."
echo "It's now safe to remove the USB Drive"

