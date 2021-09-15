##################################################################
# [][][]                              []
# []    []                            []
# []    []                            []
# [][][]      [][][]    [][][]  [][][][]  [][][]    [][][]
# []    []  []    []  [][]      []    []  []  []  []
# []    []  []    []      [][]  []    []  []      []
# [][][]      [][][]  [][][]    []    []  []        [][][]
#
#           ===============================
#
#     []][]      []        []    [][][]   [][][]  [][][][]   [][][]
#    []   []     []            []    []  []       []        []
#   [][][][[]    []        []  []    []    [][]   [][][]      [][]
#  []       []   []        []  []    []       []  []             []
# []         []  [][][][]  []    [][][]  [][][]   [][][][]  [][][]
#
# Alias definitions.
# You may want to put all your additions into a separate file like this one.
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

## Make nano the default editor ##
export EDITOR='nano'
export VISUAL='nano'

## Use Color's ##
use_color=true

## Shopt ##
#shopt -s autocd # change to named directory
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

# Setting Bash / ZSH to read the .bash_aliases file
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# Setting Bash / ZSH to read the .bashrc-personal Alias's file
#if [ -f ~/.bashrc-personal ]; then
#    . ~/.bashrc-personal
#fi

# set PATH so it includes user's private bin if it exists
 if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
 fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
#bind "set completion-ignore-case on"

## Command aliases  ##
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
# alias chmod="chmod -c"
alias e="vim -O "
alias E="vim -o "
alias svim='sudo vim'
alias ht='htop'
alias lsmount='mount |column -t'
alias ssha='eval $(ssh-agent) && ssh-add'
alias watch='watch -d'
alias wget='wget -c'

## Internet ##
alias ports='netstat -tulanp'
alias myip="curl http://ipecho.net/plain; echo"
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

## Shutdown or reboot ##
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

alias ssha='eval $(ssh-agent) && ssh-add'
alias svim='sudo vim'
alias watch='watch -d'
alias wget='wget -c'

## Logs ##
alias logs=" sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias folders='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'

## Recent Installed Packages ##
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

## Get the Error messages from journalctl ##
alias jctl="journalctl -p 3 -xb"

## userlist ##
alias userlist="cut -d: -f1 /etc/passwd"

## readable output ##
# alias df='df -h'
alias df='df -h --exclude=squashfs'

## Hardware Info --short  ##
alias hw="hwinfo --short"

## PS ##
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
function my_ps()
 { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

## add new fonts ##
alias update-fc='sudo fc-cache -fv'

## Search Manpages with Dmenu in a therminal
alias sm="dmenu_manpage_search.sh"

## Enable color support of ls and also add handy aliases  ##
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

#    alias ls='ls --color=auto'
#    alias vdir='vdir --color=auto'
#    alias l.=' ls -lhFa --time-style=long-iso --color=auto'
#    alias ls=' ls -lhF --time-style=long-iso --color=auto'

fi

## LS some more ls aliases  ##
### For --color=auto COLORS See "Enable Colors Section"
# alias ld='ls -lah'
# alias ll='ls -alF'
# alias ll=' ls'
# alias la='ls -A'
# alias l='ls -CF'
# alias f='ls -l | wc -l'
# alias l.="ls -A | egrep '^\.'"

## LSD Replacement Alias commands ##
#--> Warning Depends on LSD to be installed <--#
# -> in Arch "pacman -S lsd" Debian needs .deb from https://github.com/Peltoche/lsd NOT from Repo's' <-#
alias l.="lsd -A | egrep '^\.'"
alias l='lsd'
alias la='lsd -a'
alias ll='lsd -alF'
alias ld='lsd -la'
alias lsrd='lsd -Rla'
alias lsrf='lsd -R'
alias lst='lsd -t --tree'
alias ls='lsd -laF'
alias lsl='lsd -laFL'

##____ Backup Files ____##
#Backup contents of ~/.config to hidden backup folder in home/user
alias bupconfig='cp -Rf ~/.config ~/.config-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'

##____ Backup Dot folders ____##
alias bupdlocal='cp -Rf ~/.local ~/.local-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias bupdscreen='cp -Rf ~/.screenlayout ~/.screenlayout-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias bupdthemes='cp -Rf ~/.themes ~/.themes-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias bupdicons='cp -Rf ~/.icons ~/.icons-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias bupdfonts='cp -Rf ~/.fonts ~/.fonts-Master-backup-$(date +%Y.%m.%d-%H.%M.%S)'

## Backup contents of ~/bin & .bin to hidden backup folder in home/user
alias bupbin='cp -Rf ~/bin ~/.home-bin-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -Rf ~/.bin ~/.home-dot.bin-backup-$(date +%Y.%m.%d-%H.%M.%S)'

## Backup all the ,Bashrc files to a hidden folder
alias bupbash='mkdir ~/.master-bashrc-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -Rf ~/.bash* ~/.master-bashrc-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#Backup all the .zshrc files to a hidden folder
alias bupzsh='mkdir ~/.master-zshrc-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -Rf ~/.zsh* ~/.p10k.zsh ~/.master-zshrc-backup-$(date +%Y.%m.%d-%H.%M.%S) &&  mkdir ~/.master-oh-my-zsh-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -Rf ~/.oh-my-zsh* ~/.master-oh-my-zsh-backup-$(date +%Y.%m.%d-%H.%M.%S)'
alias bupozsh='mkdir ~/.master-oh-my-zsh-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -Rf ~/.oh-my-zsh* ~/.master-oh-my-zsh-backup-$(date +%Y.%m.%d-%H.%M.%S)'

## Switch between bash and zsh ##
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

## Help ##
alias myhelp='cat ~/.bash_aliases | grep'
alias myhelpl='less ~/.bash_aliases'
alias myhelplg='less ~/.bash_aliases | grep'
alias cheat.sh="curl cheat.sh/$1"

##  Editing  ##
alias ba='$EDITOR $HOME/.bash_aliases'

##  Nano to edit important configuration files  ##
## --> Know what you doing in these files. Some for Arch <-- ##
alias nlightdm='sudo $EDITOR /etc/lightdm/lightdm.conf'
alias npacman='sudo $EDITOR /etc/pacman.conf'
alias ngrub='sudo $EDITOR /etc/default/grub'
alias nconfgrub='sudo $EDITOR /boot/grub/grub.cfg'
alias nmkinitcpio='sudo $EDITOR /etc/mkinitcpio.conf'
alias nmirrorlist='sudo $EDITOR /etc/pacman.d/mirrorlist'
alias nsddm='sudo $EDITOR /etc/sddm.conf'
alias bls='betterlockscreen -u /usr/share/backgrounds/arcolinux/'
alias nfstab='sudo $EDITOR /etc/fstab'
alias nnsswitch='sudo $EDITOR /etc/nsswitch.conf'
alias nsamba='sudo $EDITOR /etc/samba/smb.conf'
alias nb='$EDITOR ~/.bashrc'
alias nba='$EDITOR ~/.bash_aliases'  
alias nz='$EDITOR ~/.zshrc'

## History  ##
alias h='history'
alias wdil='history | grep'
alias seecom='cat ~/.bash_history | grep'

## free.. How much memory used/free ##
alias free="free -mt"

## Get top process eating memory  ##
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu  ##
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## List largest directories (aka "ducks")  ##
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

## Safetynets  ##
# do not delete / or prompt if deleting more than 3 files at a time  #
alias rm='rm -I --preserve-root'

## Confirmation  ##
alias mv='mv -iv'
alias cp='cp -i'
alias ln='ln -i'
alias mkdir='mkdir -pv'
alias mkfile='touch'

function mcd () {
    mkdir -p $1
    cd $1
}
alias rmf='rm -rfi' # Forces all Deleteitions

## Parenting changing perms on /   ##
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

## reload bash / Zsh config  ##
alias reload='source ~/.bashrc'
alias reloadz='source ~/.zshrc'

##  Youtube-dl Aliases  ##
alias yta-aac='youtube-dl --extract-audio --audio-format aac '
alias yta-best='youtube-dl --extract-audio --audio-format best '
alias yta-flac='youtube-dl --extract-audio --audio-format flac '
alias yta-m4a='youtube-dl --extract-audio --audio-format m4a '
alias yta-mp3='youtube-dl --extract-audio --audio-format mp3 '
alias yta-opus='youtube-dl --extract-audio --audio-format opus '
alias yta-vorbis='youtube-dl --extract-audio --audio-format vorbis '
alias yta-wav='youtube-dl --extract-audio --audio-format wav '
alias ytv-best='youtube-dl -i --config-location /home/bruce/youtube-dl.conf -f bestvideo+bestaudio '

## ssh login alias  ##
if [ -f /usr/bin/ssh ]; then
  #alias sshin='ssh -X 10.28.93.1 "$1"' --> See "sshin" bash file in the ~/bin
  alias ssh0='ssh -X 10.28.93.100'
  alias ssh3='ssh -X 10.28.93.103'
  alias ssh4='ssh -X 10.28.93.104'
  alias ssh5='ssh -X 10.28.93.105'
  alias ssh6='ssh -X 10.28.93.106'
  alias ssh7='ssh -X 10.28.93.107'
  alias ssh8='ssh -X 10.28.93.108'
  alias ssh9='ssh -X 10.28.93.109'
  alias ssh10='ssh -X 10.28.93.110'
  alias ssh11='ssh -X 10.28.93.111'
  alias ssh12='ssh -X 10.28.93.113'
  alias ssh13='ssh -X 10.28.93.113'
  alias ssh14='ssh -X 10.28.93.114'
  alias ssh15='ssh -X 10.28.93.115'
  alias ssh16='ssh -X 10.28.93.116'
  alias ssh17='ssh -X 10.28.93.117'
  alias ssh18='ssh -X 10.28.93.118'
  alias ssh19='ssh -X 10.28.93.119'
  alias ssh20='ssh -X 10.28.93.120'
  alias ssh21='ssh -X 10.28.93.121'
  alias ssh22='ssh -X 10.28.93.122'
  alias ssh23='ssh -X 10.28.93.123'
  alias ssh24='ssh -X 10.28.93.124'
  alias ssh25='ssh -X 10.28.93.125'
  alias ssh29='ssh -X 10.28.93.129'
  alias ssh30='ssh -X 10.28.93.130'
  alias ssh70='ssh -X 10.28.93.170'
  #alias sshdeb3='ssh -X 192.168.0.3'
  #alias sshdeb4='ssh -X 192.168.0.4'
  #alias sshdeb5='ssh -X 192.168.0.5'
  #alias debnmap='sudo nmap -sT -O 192.168.0.1/24'
fi

## Manage packages update easier  ##
#---------------------------------#
## Debian based Distros  ##
if [ -f /usr/bin/apt ]; then
  alias update='sudo systemd-inhibit apt update'
  alias upgrade='sudo systemd-inhibit apt update && sudo apt dist-upgrade'
  alias install='sudo systemd-inhibit apt install'
  alias aremove='sudo systemd-inhibit apt autoremove'
  alias aptlist='apt list --upgradable'
  alias upclean='systemd-inhibit up --clean'
  alias upremove='systemd-inhibit up --remove'
  alias search='apt search'
# Up is Joe Collins UP Bash update script
  alias aptll='apt list | less'
fi

## Arch based Distros  ##
if [ -f /usr/bin/pacman ]; then
  alias update='sudo systemd-inhibit pacman -Sy'
  alias upgrade='sudo systemd-inhibit pacman -Syyu'
  alias install='sudo systemd-inhibit pacman -S --needed'
  alias search='systemd-inhibit pacman -Ss --needed'
  alias remove='sudo systemd-inhibit pacman -R'
  alias yinstall='systemd-inhibit yay -S --needed'
  alias yupdate='systemd-inhibit yay -Sy'
  alias yupgrade='systemd-inhibit yay -Syyu'
  alias yremove='systemd-inhibit yay -R'
  alias ysearch='systemd-inhibit yay -Ss'
## Pacman Unlock ##
  alias unlock='sudo rm /var/lib/pacman/db.lck'
  alias rmpacmanlock='sudo rm /var/lib/pacman/db.lck'
## Get fastest mirrors in your neighborhood ##
 alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
 alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
 alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
 alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
## our experimental - best option for the moment ##
 alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
 alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"

fi

## The lonly Solus  ##
if [ -f /usr/bin/eopkg ]; then
  alias update='sudo systemd-inhibit eopkg update-repo'
  alias upgrade='sudo systemd-inhibit eopkg upgrade'
  alias updistro='~/bin/systemd-inhibit up-solus'
  alias install='sudo systemd-inhibit eopkg it'
fi

## set common functions  ##
#############

## To find commands in Bash. Python, and so on. ##
function cheat()
 {
    curl cheat.sh/$1;
}

 ##_____________________________________##

## To get my IP Adress  ##
function my_ip() # Get IP adress.
{
   curl ifconfig.co
}

 ##_____________________________________##

## Find a file with a pattern in name:  ##
function ff()
{
    find . -type f -iname '*'"$*"'*' -ls ;
}

 ##_____________________________________##

## Get current host related info. ##
function sysinfo1()
{
    echo -e "\n${BRed}System Informations:$NC " ; uname -a
    echo -e "\n${BRed}Online User:$NC " ; w -hs | cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Date :$NC " ; date
    echo -e "\n${BRed}Server stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Public IP Address :$NC " ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo -e "\n${BRed}CPU info :$NC "; cat /proc/cpuinfo ;
    echo -e "\n"
}


## Archive programs funtions to Zip & Targz etc.. ##
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

## Archive programs funtions to Zip & Targz etc.. ##
function ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

 ##_____________________________________##


## Creates an archive (*.tar.gz) from given directory.  ##
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }


 ##_____________________________________##


## Create a ZIP archive of a file or folder.  ##
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

 ##_____________________________________##

## A list of all the color codes being used I think... ## 
# alias colors="~/bin/colors.sh"
#function colors() {
#	local fgc bgc vals seq0
#
#	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
#	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
#	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
#	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
#
#	# foreground colors
#	for fgc in {30..37}; do
#		# background colors
#		for bgc in {40..47}; do
#			fgc=${fgc#37} # white
#			bgc=${bgc#40} # black
#
#			vals="${fgc:+$fgc;}${bgc}"
#			vals=${vals%%;}
#
#			seq0="${vals:+\e[${vals}m}"
#			printf "  %-9s" "${seq0:-(default)}"
#			printf " ${seq0}TEXT\e[m"
#			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
#		done
#		echo; echo
#	done
#}

## End
