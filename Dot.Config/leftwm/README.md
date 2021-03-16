### My LefrWm config & Scripts & Themes
Here are my LeftWm Config and some of my scripts with various custom settings.
You will also find a script and a Keybinding.txt that I use to show what the keybinding are I have setup... You will have to slso modifiy this to your needs!
-Bruce

## Here are the commands to change the Themes.

### To change the LeftWM bar themes use the command below. (02-28-2021)
ln -s PATH_TO_THE_THEME_YOU_LIKE current

#### How to change themes.

#### 1 Remove the symlink to your current theme if set
rm ~/.config/leftwm/themes/current

Type "yes"

#### 2 Set this as your current theme
ln -s ~/.config/leftwm/themes/Bruce_polybar ~/.config/leftwm/themes/current

#### 3 Restart your window manager
$MOD + Shift + r
