####   <<<---================}[ Hal-9000-info.sh ]{================--->>>

 ---------------------------------------------------------------------

#### Current Version: v.1.3.2 Modified by Bruce Scott 09/01/2021
* Script Name  : Hal-9000-info.sh v.1.3.2
* Description  : Terminal Based script to displays System and IP Network Information
* Dependencies : awk, ip, nmcli, wget, dmidecode, awk, grep, hdpram, lsblk, inxi, network-tools
* Arguments    : help -h, version -v
* Author       : Bruce E. Scott, 03 Jun 2019
* Linux Form   : I can be reached at https://www.ezeelinux.com/talk/index.php (bescott9944)
* Comment 1.   : v.0.3 script concept and building.. Current Version: v.1.3.2 Modified by Bruce Scott 09/01/2021
* Comment 2.   : Requires root/sudo privileges
* Note         : dmidecode may produce error messages in some systems. They can be
                safely ignored and removed from file with any text editor.

 ---------------------------------------------------------------------

####     <---> ]["MyStat.sh"][ <--->       Copyright (C) 2019, Bruce E. Scott

#### <<<---================}[ Name Change on 09/02/2020 ]{================--->>>

#### <<<---================}[ Hal-9000-info.sh ]{================--->>>

 ---------------------------------------------------------------------

## What is Hal
Hal-9000-info.sh is a script that will produce a output in the terminal. Hal will also
produce a file in the /home/username folder with the extension of system name.stats (ie Stargazer-PeP10.stat)
That way with the information being in a text file you will always have a hard copy. Sure you can run the script
as many times as you want as it will also be time stamped when the script was ran!

NOTE: The System-name.stat (ie Stargazer-PeP10.stat) will be over written every time the script is ran, so with that in mind
if you want to keep a running total of changes you will have to save the .stat file in you /home/user-name folder to another
folder of rename the .stat to something else! You will have to know how to do this as it is beyond the scope of the script or
this document....
## A Few Words about Hal
Hal started out as MyStat.sh with v.0.3 Beta on 04/12/2019.
MyStats.sh started out as a need to get some system information for a issue I was having with
Linux Mint and EndeavourOS Arch. The folks that were trying to help were asking question on the Distro's
and hardware, this setting, what did this say and so on...

So I found Richard Romig's scripts that he posted over at https://www.ezeelinux.com/talk where I was getting
some of the information they wanted and running command that they gave me. So I decided to learn how to make a
script. Now I was use to making BAT file back in the DOS days with Dos 3.3, so I thought it can not be that hard! Right? Lol
Well I did have to learn how to use some new syntax but it wasn't that hard, kinda... :-)
I want you to understand that I am not a programmer or a experienced in scripting so the script is not perfect but it works as is...

Well that stared several months of testing and more testing and help from the good folks over at
https://www.ezeelinux.com/talk forum... Great bunch of folks. I also had some help from Leon.P at Ezeetalk
forum with a issue with INXI... The folks over at EndeavourOS forum, https://forum.EndeavourOS.com/ ...
I did a bunch of VM testing with all kinds of Distro's from Arch, Debian and Debian based distros like Mint EndeavourOS
MX, Debian 10 and Ubuntu server.

I then went to real hardware with the same distros as I do use most of them anyway and that is where I found the Issue
with INXI being in different directories on some distros...
I tested on my used systems I built and several laptops from Dell and Acer and a few I borrowed. lol
They were all kind of hardware combos so it was a good testing bed..

Anyway, I finally got this all working to probe the system to get all the information with all the standard files
that are installed on 99.9% of the Linux Distro's by default... This was kinda important so users did not have
to install additional software...

In September 2021 I have also added Battery information for those that have laptops. Whiles I have a Dell and a Acer
laptop and a few friends also tested the function for me. With that said there might still be error reporting
on newer laptops. I have not heard anything from anyone one way or the other!
Also added ERR checking for needed files and added 'help -h' & 'version -v' information.

There has been a few months testing and the script is working OK for now. There is still
a issue with "INXI" on some systems where it is stored in different location on some Distro's.
I am working on this issue and will update this script as soon as I get the wording worked
out... :-)

There was also a name change from Mystats.sh to Hal-9000-info.sh because it sounds cooler and I
am a big fan of both the movies!

## Known Issues:
Been working on "Inxi" checking to make sure where it is and use that one. There is still a chance it will faile!
There is still a issue with "INXI" on some systems where it is stored in different location on some Distro's.
Just edit the script and set the location of INXI path to your path of your INXI... (IE. /bin/inxi or /use/bin/inxi)
This will fix the issue until I get the chance to add testing in the script for the location of INXI..

Thanks you for looking at my Hal-9000-Info script...
-Bruce
