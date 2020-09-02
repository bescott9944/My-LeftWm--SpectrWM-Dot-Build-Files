
####   <<<---================}[ Hal-9000-info.sh ]{================--->>>

 ---------------------------------------------------------------------

#### Current Version: v.1.3.0 Modified by Bruce Scott 09/2/2020
* Script Name  : Hal-9000-info.sh v.1.3.0
* Description  : Displays System and IP Network information
* Dependencies : awk, ip, nmcli, wget, dmidecode, awk, grep, hdpram, lsblk, inxi, network-tools
* Arguments    : None
* Author       : Bruce E. Scott, 03 Jun 2019
* Linux Form   : I can be reached at https://www.ezeelinux.com/talk/index.php (bescott9944)
* Comment 1.   : v.0.3 script concept and building.. Current Version: v.1.3.0 Modified by Bruce Scott 09/2/2020
* Comment 2.   : Requires root/sudo privileges
* Note         : dmidecode may produce error messages in some systems. They can be
                safely ignored and removed from file with any text editor.

 ---------------------------------------------------------------------

>####   <---> "ABOUT MyStat.sh" <--->
>####   Copyright (C) 2019, Bruce E. Scott

>####   <<<---================}[ Name Chang on 09/02/2020 ]{================--->>>

>####    <<<---================}[ Hal-9000-info.sh ]{================--->>>

 ---------------------------------------------------------------------

## A Few Words about Hal
>Hal started out as MyStat.sh with v.0.3 Beta on 04/12/2019.
MyStats.sh started out as a need to get some system information for a issue I was having with
Linux Mint and EndeavourOS Arch. The folks that was trying to help were asking question on the Distros
and hardware, this setting, what did this say and so on...

>So I found Richard Romig's scripts that he posted over at https://www.ezeelinux.com/talk where I was getting
some of the information they wanted and running command that they gave me. So I decided to learn who to make a
script. Now I was use to making BAT file back in the DOS days with Dos 3.3 so I thought it can not be that hard! Lol
Well I did have tho learn how to use some syntax but that wasn't that hard... :-)

>Well that stared several months of testing and more testing and help from the good folks over at
https://www.ezeelinux.com/talk forum... Great bunch of folks. I also had some help from Leon.P at Ezeetalk
forum with a issue with INXI... The folks over at EndeavourOS forum, https://forum.endeavouros.com/ ...

Anyway I finally got this all working to probe the system to get all the information with all the standard files
that are installed on 99.9% of the Linux Distros by default... This was kinda important so user did not have
to install additional software...

>There has been a few months testing and the script is working OK for now. There is still
a issue with "INXI" on some systems where it is stored in different location on some Distros.
I am working on this issue and will update this script as soon as I get the wording worked
out... :-)

>There is also a name change from Mystats.sh to Hal-9000-info.sh because it sounds cooler and I
am a big fan of both the movies!

## Known Issues:
>There is still a issue with "INXI" on some systems where it is stored in different location on some Distros.
Just edit the script and set the location of INXI path to your path of your INXI... (IE. /bin/inxi or /use/bin/inxi)
This will fix the issue until I get the chance to add testing in the script for the location of INXI..

>Thanks you for looking at my Hal-9000-Info script...
-Bruce
