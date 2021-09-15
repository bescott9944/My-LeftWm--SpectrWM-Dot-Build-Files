#########################
# ~/.bashrc
#
#
# [][][]                              []
# []    []                            []
# []    []                            []
# [][][]      [][][]    [][][]  [][][][]  [][][]      [][][]
# []    []  []    []  [][]      []    []  []  []    []
# []    []  []    []      [][]  []    []  []        []
# [][][]      [][][]  [][][]    []    []  []          [][][]
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# <<<<[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi





# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
#		PROMPT_COMMAND='echo -ne "\033]0;Starfleet:>> ${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		PROMPT_COMMAND='echo -ne "\033]0;:${PWD/#$HOME/\~} @ ${USER}@${HOSTNAME%%.*} <<:Starfleet Command:>> \007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_Starfleet Command:>> ${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
#		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
#        PS1='\[\033[1;33m\]Starfleet:>> \[\033[01;32m\]\u@\h\[\033[00m\]:\n\[\033[01;34m\] >> \w\[\033[1;33m\] :\[\033[00m\] -> '
         PS1='\[\033[1;33m\]Starfleet:>> \[\033[1;34m\][Date \d][Time \@] \n\[\033[01;32m\]\u@\h\[\033[00m\]:\n\[\033[01;34m\]>>\w\[\033[1;33m\]:\[\033[00m\]\$ > '

	else

         PS1='\[\033[1;33m\]Starfleet:>> \[\033[1;34m\][Date \d][Time \@] \n\[\033[01;32m\]\u@\h\[\033[00m\]:\n\[\033[01;34m\]>>\w\[\033[1;33m\]:\[\033[00m\]\$ > '
#       PS1='\[\033[1;33m\]Starfleet:>> \[\033[01;32m\]\u@\h\[\033[00m\]:\n\[\033[01;34m\] >> \w\[\033[1;33m\] :\[\033[00m\] -> '
#		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

# alias cp="cp -i"                          # confirm before overwriting something
# alias df='df -h'                          # human-readable sizes
# alias free='free -m'                      # show sizes in MB
# alias np='nano -w PKGBUILD'
# alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Run /bin/end-info-v3-icons info screen when starting bash
 if [ -f ~/bin/end-info-v3-icons ]; then
    . ~/bin/end-info-v3-icons

# Run /bin/end-info-v3 info screen when starting bash
 elif [ -f ~/bin/end-info-v3 ]; then
    . ~/bin/end-info-v3

# Run /bin/Archinfo-v3-bes info screen when starting bash
 elif [ -f ~/bin/archinfo-v3-bes ]; then
    . ~/bin/archinfo-v3-bes

# Run /bin/manjarinfo info screen when starting bash
 elif [ -f ~/bin/manjarinfo ]; then
    . ~/bin/manjarinfo

  else
    neofetch
fi

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# set PATH so it includes user’s private bin if it exists
# test -d “$HOME/bin” && PATH=”$HOME/bin:$PATH”

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"


# source /home/bruce/.config/broot/launcher/bash/br
#source /home/bruce/.config/broot/launcher/bash/br

 if [ -f /home/bruce/.config/broot/launcher/bash/br ]; then
    source /home/bruce/.config/broot/launcher/bash/br 2>/dev/null
fi

# ------------------------------------------------
# Getting Current Weather & Colors for STD output... 07/15/2021 -Bruce
# ------------------------------------------------
# color library
default=`echo -en "\e[39m"`
red=`echo -en "\e[31m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
gray=`echo -en "\e[30m"`

bold=`echo -en "\e[1m"`
normal=`echo -en "\e[0m"`

# echo -e Current Weather
# Run /bin/Kweather.sh to print Weather om screen when starting Bash/Zsh
 if [ -f /home/bruce/Documents/Master-Docs//term-weather.txt ]; then
    cat /home/bruce/Documents/Master-Docs//term-weather.txt

  else
    echo -e "\t --> ${red}ERROR ${orange}term-weather.txt File Not Found! ${red}ERROR ${default}<--${default}\n"
    echo -e "\t -> Possiable Fix's"
    echo -e "\t -> 1. Check Server CronJob or Path or term-weather.txt"
    echo -e "\t -> 2. Check path or file in /N-1-MD-500-Sata/Master-Documents/term-weather.txt"

fi


