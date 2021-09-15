#!/bin/bash
# Replace the /usr/lib/os-release to that the (On: XXX) is shown on the conky...
set -e
# Checking for sudo permissions:

sudo ls > /dev/null
  echo -e
echo "Replaceing the os-release:"
    cp /usr/lib/os-release ~/bin/os-release/os-release.old
    cp ~/bin/os-release/os-release /usr/lib/os-release
exit 0
