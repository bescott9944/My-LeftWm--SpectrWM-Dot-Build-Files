# LeftWM - A window manager for Adventurers
![CI](https://github.com/leftwm/leftwm/workflows/CI/badge.svg)

![Screenshot of LeftWM in action](screenshots/4.jpg)

## Why go left 

Left is a tiling window manager written in rust for stability and performance. The core of left is designed to do one thing and one thing well. Be a window manager. Because you probably want more than just a black screen, LeftWM is built around the concept of theming. With themes you can choose between different bars, compositors, backgrounds, colors, whatever makes you happy.   

LeftWM has been built from the very beginning to support multiple screens and has been built around ultrawide monitors. You will see this with the default key bindings

## Left is NOT

Left is not a compositor.

Left is not a lock screen.

Left is not a bar. But, there are lots of good bars out there. With themes, picking one is as simple as setting a symlink.



## This is my LeftWM Window manager setup. (Use at your own Risk)

Here you will find my Dot Files and Scripts I use for my LeftWM setup that I use on my EndeavourOS Arch install...
Some of these files were borrowed from OTB, DT, Linux Dabbler and other sources. I don't remember where I got them all
but here they are! I know some of the script might not be worded right but they work for me. Edit them as you wish...
I have included all my "~/bin files". Polybar, Rofi, and other files, my config file, Thenes build files.. Enjoy!


I have found some things that were not in the Wiki and I got them from the Bug Reports and they fixed my issues.
I fmund this in a Report but later found in ght Wiki.
---
[[keybind]]
command = "FocusNextTag"
modifier = ["modkey"]
key = "Right"

[[keybind]]
command = "FocusPreviousTag"
modifier = ["modkey"]
key = "Left"
---
With these I can use the arrow keys and it works just like in SpectrWm where you hold down the Modkey and use the arrow keys to move between the tags!
This was a must for me. If you like to use the Vim keys just change the "KEY = "J"" or to what evr you want.

Now I had some screen resolution issue and I had to file a Bug Report. The Dev, an 2 theres jumped right in and had me fixed within 2 days of texting back and forth.
---
 I got LeftWm all sorted.. Took a bit of work and a bunch of chatting on the Github Bug Report but thanks for the Great folks over there we got things working...
The polybar was easy. I figured that one out. I looked at othere Themes that had the bar on the bottom and found out how they did that
There is a setting you change and it is on the bottom... Like this

; Put the polybar at the bottom of the screen-default = false
bottom = true

The desktop was a 4 day message back and forth / testing and the great help I got was fantastic!
LeftWm desktop would not go into 1920x1080 and stayed stuck in 1360x768. Arch's default boot this monitor / Tv at 1360x768 and EndeavourOS changes it to 1920x1080 on booting into Cinnamon.
Logging into LeftWm you don't have that and there are things one needs get the resolution set right. Most folks have a xorg.conf that deals with that but AMD does not have any setup for Linux so ya have to do thing manually.
When I set the display with xrandr LeftWm would change but the desktop is all squished into the upper left of the screen.

In the end to fix my issue after 4 days is they had me created a ".xprofile" and added the xrandr commands in there... This is the commands that I used for my Monitor / Tv...

xrandr --output VGA-0 --off --output DVI-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

Now LeftWm boots onto 1920x1080 and all is right as rain! :-D
As a added Bonus, SpectrWm uses .xprofile too and I did away with 2 scripts I was using for Spectrwm to get the resolution set, so Yall.. Things are great!
I hope this may help anyone else that has these issues... :-)

So that is some of the things I had fun with and yes it was a adventure! Lol



## please read the rest of this read me as it mostly came from LeftWM Github README.md
Please install all the Dependencies and programs, Themes. Most of all follow the instruction on the Themes to make the Links to the folders.
That is it! Have fun!
Thanks LeftWm Devs for such a cool Window Manger!



## Config
The settings file to change key bindings and the default mod key can be found at
```
~/.config/leftwm/config.toml
```

### Default keys
```
Mod + (1-9) => Switch to a desktop/tag
Mod + Shift + (1-9) => Move the focused window to desktop/tag
Mod + W => Switch the desktops for each screen. Desktops [1][2] changes to [2][1]
Mod + Shift + W => Move window to the other desktop
Mod + (⬆️⬇️) => Focus the different windows in the current workspace
Mod + Shift + (⬆️⬇️) => Move the different windows in the current workspace
Mod + Enter => Move selected window to the top of the stack in the current workspace
Mod + Ctrl + (⬆️⬇️) => Switch between different layouts
Mod + Shift + (⬅➡) => Switch between different workspaces
Mod + Shift + Enter => Open a terminal
Mod + Ctrl + L => Lock the screen
Mod + Shift + X => Exit LeftWM
Mod + Shift + Q => Close the current window
Mod + Shift + R => Reload LeftWM and its config
Mod + p => Use dmenu to start application
```

### Workspaces
By default, workspaces have a one-to-one relationship with screens, but this is configurable. There are many reasons you might want to change this, but the main reason is for ultrawide monitors. You might want to have two or even three workspaces on a single screen. 

Here is an example config changing the way workspaces are defined (~/.config/leftwm/config.toml)
```
[[workspaces]]
y = 0
x = 0
height = 1440
width = 1720

[[workspaces]]
y = 0
x = 1720
height = 1440
width = 1720
```

### Tags / Desktops
The default tags are 1-9. They can be renamed in the config file by setting the
list of tags.

Here is an example config changing the list of available tags. NOTE: tag navigation (Mod + #) doesn't change based on the name of the tag
```
tags = ["Web", "Code", "Shell", "Music", "Connect"]
```

[More information about configuration can be found in the Wiki](https://github.com/leftwm/leftwm/wiki/Config).


### LeftWM is [EWMH](https://en.wikipedia.org/wiki/Extended_Window_Manager_Hints) compliant.




## One of the core concepts/features of LeftWM is theming 

With left, there are two types of configs. First, there are config settings that are specific to you but don’t really change. These are settings like keybindings, workspace locations, and names of desktops/tags. These settings can be found in ~/.config/leftwm/config.toml

The appearance of your desktop is different. It’s fun to try new looks and feels. It’s fun to tweak and customize the appearance (also known as ricing). It’s fun to share so others can experience your cool awesome desktop. LeftWM is built around this concept. By pulling all these settings out into themes, you can now easily tweak, switch, and share your experiences. 

## Setup (with package manager)

LeftWM is available in AUR as well as crates.io. Both are good options for simple installation. Please note, if installing with crates.io you will need to link to the xsession desktop file if you want to be able to login to LeftWM from a graphical login screen. 
```bash
sudo cp PATH_TO_LEFTWM/leftwm.desktop /usr/share/xsessions
```

LeftWM is also available in Fedora [Copr](https://copr.fedorainfracloud.org/coprs/atim/leftwm/): `sudo dnf copr enable atim/leftwm -y && sudo dnf install leftwm`

## Manual Setup (no package manager)

### Using a graphical login such as LightDM, GDM, LXDM, and others

1) Copy leftwm.desktop to /usr/share/xsessions
2) Create a symlink to the build of leftwm so that it is in your path:
```bash
cd /usr/bin
sudo ln -s PATH_TO_LEFTWM/target/debug/leftwm
sudo ln -s PATH_TO_LEFTWM/target/debug/leftwm-worker
sudo ln -s PATH_TO_LEFTWM/target/debug/leftwm-state
```
and
```bash
sudo cp PATH_TO_LEFTWM/leftwm.desktop /usr/share/xsessions
```
You should now see LeftWM in your list of available window managers.

### Starting with startx or a login such as slim
Make sure this is at the end of your .xinitrc file:
```bash .xinitrc
exec dbus-launch leftwm
```

### Themes
If you want to see more than a black screen when you login, select a theme:
```bash 
mkdir -p ~/.config/leftwm/themes
cd ~/.config/leftwm/themes
ln -s PATH_TO_THE_THEME_YOU_LIKE current
```
LeftWM comes packaged with a couple default plain themes. There is also a [community repository for sharing themes](https://github.com/leftwm/leftwm-community-themes)

For more information about themes checkout our theme guide [here](https://github.com/leftwm/leftwm/tree/master/themes) or the wiki [here](https://github.com/leftwm/leftwm/wiki/Themes).

### Dependencies 
While LeftWM has very few dependencies, this isn't always the case for themes.
Themes typically require the following to be installed. However, this is up to the
author of the theme, and could be different. 
List of common dependencies for Themes: 
- feh 
- compton or picom
- dmenu
- (Some kind of bar, different for each theme)
    - polybar 
    - xmobar 
    - lemonbar 
    - conky 


| Build Dependency | ubuntu20.4.1              |
| ---------------- | ------------------------- |
| feh              | sudo apt install feh      |
| compton          | sudo apt install compton  |
| picom            | manual                    |
| polybar          | manual                    |
| xmobar           | sudo apt install xmobar   |
| lemonbar         | sudo apt install lemonbar |
| conky            | sudo apt install conky    |
| dmenu            | sudo apt install dmenu    |
