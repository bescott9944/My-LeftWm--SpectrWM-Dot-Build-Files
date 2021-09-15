# Change-log.md
      _                                           
     /  |_   _. ._   _   _  |  _   _    ._ _   _| 
     \_ | | (_| | | (_| (/_ | (_) (_| o | | | (_| 
                     _|            _|             


 Lead Developer: Bruce E. Scott
 Script Creator: Bruce E. Scott
 GitLab: https://gitlab.com/bescott9944
 Forums: https://www.ezeelinux.com/talk/bescott9944
         https://forum.endeavouros.com/bescott9944
 Licensed under the GNU and MIT respectively


####   <<<---================}[ Hal-9000-info.sh ]{================--->>>

### -----------------------------------------------------

#### Current Version: v.1.3.2 Modified by Bruce Scott 09/01/2021
* Script Name   : Hal-9000-info.sh v.1.3.2
* Description   : Terminal Based script to displays System and IP Network Information
* Dependencies  : awk, ip, nmcli, wget, dmidecode, awk, grep, hdpram, lsblk, inxi, network-tools
* Arguments     :  help -h, version -v
* Author        : Bruce E. Scott, 03 April 2019
* Started On    : 12 April 12:44 p.m. EST 2019 v.0.3 Beta
* Last Change   : 31 August 10:15 a.m. EST 2021
* Author E-Mail : bescott9944@gmail.com
* Author GitHub : https://github.com/bescott9944
* Author Gitlab : https://gitlab.com/bescott9944
* Linux Forms   : I can be reached at https://www.ezeelinux.com/talk/index.php (bescott9944)
* Comment 1.    : v.0.3 script concept and building.. Current Version is v.1.3.2 -Bruce - 08/31/2021
* Comment 2.    : Requires root/sudo privileges
* Note          : dmidecode may produce error messages on some systems. They can be
*                safely ignored and removed from file with any text editor.

### -----------------------------------------------------


#### April 12th 2019
Started the MyScript.sh

### -----------------------------------------------------

#### v.0.3 Beta Change log. 04/12/2019
 Script concept and start building and Planing.. -Bruce
### -----------------------------------------------------

#### v.0.3 Beta Change log. 05/10/19
 <--( inxi -c0 -Fxzd )-->
 I added the "inxi -c0 -Fxzd" command to get another set information that has the Mobo -Bruce
 NOTE: This decision led to some issues later in the Change log -Bruce
### -----------------------------------------------------

 I pulled all the commands from the 2 above "Snippet Scripts" which do most of the work 
 and I add my own to make up this full script. This script displays the information on screen
 and a file in your /home/your-name under the name of the system "XXXXX.stat"...
 I merged all the scripts and commands to make it all work... :D --Bruce E. Scott
### -----------------------------------------------------

#### v.0.4 Beta Change log. 05/22/2019
 After a bunch of changes and testing we moved the Version to v.1.0 -Bruce
### -----------------------------------------------------

#### v.1.0 change log 6/03/29
 Today I moved the script from Beta to a working version of v.1.0 -Bruce
### -----------------------------------------------------

#### v.1.0 Change log. 6/14/19
 Added new commands for the IP. Inxi, and document updates. Fixed bugs in the command
 structure. Various other small changes and fixes....
 6/14/19 added the path to "inxi" so that it would not rely on the $PATH
 to function...
### -----------------------------------------------------

 NOTE::: 6/14/19  <----"TO DO"----> ???
 You need to changed the ("nmcli dev" an "print $1" to $6) variables so it will would read
 "Active" Nic cards in a 2 Nic card system..... Like this...

  ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1}') 
  ethint=$(nmcli con show --active | grep 'ethernet' | awk '{print $6}')
  ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1,$3}' to get -->($1)enp2s0  ($3)connected

   wifint=$(nmcli dev | grep 'wifi' | awk '{print $6}')
   wifint=$(nmcli dev | grep 'wifi' | awk '{print $1}') ##  Changed the $1 to $6... -Bruce
### -----------------------------------------------------

#### v1.0.2 change log. 6/16/19
 Hard drive function section added today!
 A BIG Thanks goes out to Leon.P for his Hdd Function for the script.
 The function list all the hard drives and there information for the output
 for the script.... Thank You very Much!! Leon.P
 The inxi section is still flaky... -Bruce
### -----------------------------------------------------

#### v1.0.3 Change log. 6/17/19
 Added more Computer Information variables and commands so that 
 the board info is pilled with dmidecode command. Created new output
 variables for the information so that is can be displayed on the screen.
 I added the same for the Bios/vendor too..
 --> Note:  On some Distro's "hdpram" is not installed by default.
 You will have to install it for this section to function... 
 still dealing with inxi not always working on various Distro's --Bruce E. Scott
### -----------------------------------------------------

#### v1.0.3 Change log. 7/04/19
 Made several changes today. I moved all the variables to the top o the script
 for similarity.
 I have found that for some reason this script will not run in a folder that is
 in the $PATH statement on MX & Manjaro Arch Distro's. Works fine on other Debian/Ubuntu Distro's...
 Someday I will figure it out. I is a issue with "INXI". In the script and in the $PATH, the 
 script gets stuck in a loop on the "INXI" command in the script and will run until the
 system crashes..... One has to use the key combo "Ctrl + C" to exit the script... -Bruce
### -----------------------------------------------------

#### v1.0.3 Update log 8/11/19
 Manjaro and MX Linux sometimes has issues running the inxi
 command at times. Sometimes it works and sometime it hangs on inxi
 and starts to eat CPU time and Memory until the system will crash!
 You will have to watch and see if the screen hangs for along time
 at a blank screen with a flashing cursor! Amy more that 5 seconds
 you will have to hit the " CTRL + C " to stop the script!
 I have not figured it out yet... -Bruce
### -----------------------------------------------------
#### v1.0.3 Change log. 8/18/19
 Finely give up a week ago and made a ~/home/bin/info to store
 the main Mystat-system_name file and place a mystat like mystatMX or mystatDF for Defiant
 this is the only thing I know to do as INXI is still hanging on every Distro but Mint 18.3...
 I did this on all the box's till I get the $PATH issue sorted out, So far
 the EzeeTalk forum has been stumped too! --Bruce
### -----------------------------------------------------

#### v1.0.3 Change Log. 8/18/19 - 8/19/19
 Deck_luck on EzeeTalk.com offered some of his time to help fix the INXI hanging in a loop.
 He's trying to figure out the issue!
 I sent Deck_luck the master script and all the information on all the Distro's
 with there Version numbers for INXI. Also sent all the .bashrc's from all of the Distro's...
 Thanks Deck_luck! -Bruce
### -----------------------------------------------------

#### v1.0.3 Change Log. 8/20/19
 On 8/20/19 Deck_luck on EzeeTalk.com came up with this small script that fix's
 the INXI command from hanging and getting caught in a loop on any INXI v2.3.x.x-00
 or higher! There is a bug in the newer versions that keep calling the parent --version.
 Deck_luck sent a bug report tot he Dev and the Dev said that it was a "child corner bug"
 and closed the bug report even after Deck_luck sent his the process, scripts, the fix and the
 Dev is a bit of a but...
 Thank you Deck_luck for your time and the fix! -Bruce
### -----------------------------------------------------

#### v1.0.3 Change log. 8/25/19
 After several days of testing the Mystat script with Deck_luck's fix for the INXI
 hanging issues and further testing on all the Distro's I have on Hardware, also on some
 VM's I can say that is is fixed and works as intended... The script has been tested on
 Mint 18.3 - 19.2, Manjaro, Linux-MX, Peppermint 10 as well sever Disto's in VM's.... -Bruce
### -----------------------------------------------------

#### v1.0.3 Change log. 8/26/19
 I have decided to raise the Version Number to v1.2.0....
 I do not see any issues at this time..... -Bruce
### -----------------------------------------------------

#### v1.2.1 Change Log 09/17/2019
 I Split the AWK command into 2 AWK commands to get a
 better "Gateway and Adapter" information for the Network...
 I Added the "AWK Output" to the Network Section to change the IP Router Information..
 I also added NEW "Other HDD Information:" to get more and better HDD information...
 I also Added VENDOR, UUID information to the"lsblk" to the Hard drive Section...
 I also added the "df -h" to the Hard drive Information Section for more information...
 I also made a bunch of Line and Display output Changes so that
 the STDOUT look better. Version Number updated too...v.1.2.2   -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change Log 09/19/19
 Battery Interfaces:

 I fixed The Battery Display option when script is Ran on a Laptop
 so that the information is correct. Was never checked on my Laptop
 until today.
 Also added the ( echo -e "Battery Information:") to the output, it did not have one
 Things to do; write the code to show when the "AC" power is plugged in and it is charging... 09/19/2019/ -Bruce

 Changed the AWK output to read the "IP4.GATEWAY to get a better IP output
 because some Distro's do not use the IP$.DNS, like Ubuntu Server 18.04. I checked Mint 18.3,
 X 18.3, Manjaro, Peppermint 10. So this should be good for now... 09/20/2019 -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change Log 09/20/19
 I went through all the code and found that there was 2 of the same "variables" that were in separate areas
 along with others from the "Coping and Pasting" of all the scripts together. Most were not causing any issues
 but the 2 variables were making some issues on Ubuntu Server.
 So I moved all the script variables to the top of the script to the "Base variables" section so that
 they are all together and streamlines the Code... -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change Log 09/20/19
 I am now checking and testing the script on Mint 18.3 / 19.2, MX-18.3, Manjaro 18.04,
 Ubuntu Server 18.04 Distro's. This is done to check "Portability" of the script.....
 Also worked on some working and added some fancy ASCII art stuff to make the output pretty!
 Started testing on laptops to see IF the wifi and battery section reports correctly as I never
 checked these functions....                                                                       -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change Log 10/01/19
 Checking code. Fixed some spacing on some lines. Added some more separators...
 **--- TO-DO Still need to work on the Wifi issues not showing like I want. Battary/AC reporting..  -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change Log 10/09/19
 Today I did some more punctuation fixing. Also I worked on the Wifi section for laptops
 to show correct ports for wifi and either net... Started testing on my Dell Latitude 6410
 and my Acer Extensa 4420 to get the IP,Port,Battery reporting to work correctly on the laptops.
 Checked Port reporting with and without the Ethernet cable plugged in and Wifi turned off. So Far so Good!

 *** TO-DO Item, see if there is a way to show when the laptop is on the battery or AC when script is ran...***
 Tomorrow start testing on the Desktops again and make sure that the script function correctly on Desktops!   -Bruce
### -----------------------------------------------------

#### v.1.2.2 Change log 09/02/2020
 Well the time has come for a Name change to Hal-9000-Info and a version change...
 This will also be published on my GitHub and GitLab accounts @ bescott9944/Hal-9000-Info...
 The script has worked just fine the last few months so I am going to call it done for now! :-)

 The new Version Number is v.1.3.0 Modified 09/2/2020 -Bruce
### -----------------------------------------------------

#### V.1.3.0 Change Log 10/09/2020
 Got the script uploaded to GitHub & GitLab.
 I still have to look into the INXI still not function on some Diftros because of
 a path issues. Will work on that issue in a day or two...          -Bruce
### -----------------------------------------------------

#### V.1.3.2 Change Log 09/01/2021
 Well it has been a year of hell from rain. drought, COVID and other 2020 crap.
 Any rate while the Covid took things to strange levels I have worked on Hal-9000-Info.sh
 from time to time. Made some changes here and there with some important additions.
 Two main ones were improvements to the Laptop Battery information and the INXI issue
 that just keeps on giving.
 The Battery now shows more information like on charge and percentage and so on.
 INIX seams to be installed in several places on Distro's so I added some checking for
 INXI and then use that file.
 I also have started to implement the dependencies checking to make sure that they are installed
 on the system. NOTE this is a work in progress at this time.
 I also moved the version number to because of the changes to V.1.3.2...
 PLEASE Use this at you Own Risk as all software has the possibility of Fubaring your system.
 Thank you for giving my incarnation of Hal-9000-Info script... -Bruce
### -----------------------------------------------------

#### V.1.3.2 Change Log 09/13/2021
 Ok, I have been watching TerminalForLife's videos about scripting and he keeps
 going on about printf. So I ahave been changing all 'echo' commands to printf '%s\n'
 and fixing th placement of the menu lines.
 Still have some work to do on them but for now there ok.
 Made some changes to the Testing section for the checking for the dependencies.
 Did some tweeking in the InxI checking too. That still needs some more work
 too... I also snitched TerminalForLife's Err function and added
 his --help & --version flags section. Once more Into the Flames of Hell! -Bruce
### -----------------------------------------------------

### -----------------------------------------------------

### -----------------------------------------------------

### -----------------------------------------------------
