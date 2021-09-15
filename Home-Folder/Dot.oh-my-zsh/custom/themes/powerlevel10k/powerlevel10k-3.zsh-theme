#######################################################
####### Anarchy ZSH configuration file    #######
#######################################################

### Set/unset ZSH options
#########################
# setopt NOHUP
# setopt NOTIFY
# setopt NO_FLOW_CONTROL
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
# setopt AUTO_LIST
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME
unsetopt BG_NICE
setopt CORRECT
setopt EXTENDED_HISTORY
# setopt HASH_CMDS
setopt MENUCOMPLETE
setopt ALL_EXPORT

### Set/unset  shell options
############################
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

### Autoload zsh modules when they are referenced
#################################################
autoload -U history-search-end
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

### Set variables
#################
# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH="/usr/local/bin:/usr/local/sbin/:$PATH"
HISTFILE=$HOME/.zhistory
HISTSIZE=2000
SAVEHIST=2000
HOSTNAME="`hostname`"
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';

### Load colors
###############
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
done

### Set Colors to use in in the script
#############
# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

### Set prompt
##############
# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8
################################################################
# Powerlevel10k Theme
# https://github.com/romkatv/powerlevel10k
#
# Forked from Powerlevel9k Theme
# https://github.com/bhilburn/powerlevel9k
#
# Which in turn was forked from Agnoster Theme
# https://github.com/robbyrussell/oh-my-zsh/blob/74177c5320b2a1b2f8c4c695c05984b57fd7c6ea/themes/agnoster.zsh-theme
################################################################

# Temporarily change options.
'builtin' 'local' '-a' '__p9k_src_opts'
[[ ! -o 'aliases'         ]] || __p9k_src_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || __p9k_src_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || __p9k_src_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

(( $+__p9k_root_dir )) || typeset -gr __p9k_root_dir=${POWERLEVEL9K_INSTALLATION_DIR:-${${(%):-%x}:A:h}}
(( $+__p9k_intro )) || {
  # Leading spaces before `local` are important. Otherwise Antigen will remove `local` (!!!).
  # __p9k_trapint is to work around bugs in zsh: https://www.zsh.org/mla/workers/2020/msg00612.html.
  # Likewise for `trap ":"` instead of the plain `trap ""`.
  typeset -gr __p9k_intro_base='emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH OPTARG IFS=$'\'' \t\n\0'\'
  typeset -gr __p9k_intro_locale='[[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }'
  typeset -gr __p9k_intro_no_locale="${${__p9k_intro_base/ match / match reply }/ MATCH / MATCH REPLY }"
  typeset -gr __p9k_intro_no_reply="$__p9k_intro_base; $__p9k_intro_locale"
  typeset -gr __p9k_intro="$__p9k_intro_no_locale; $__p9k_intro_locale"
}

zmodload zsh/langinfo

function _p9k_init_locale() {
  if (( ! $+__p9k_locale )); then
    typeset -g __p9k_locale=
    (( $+commands[locale] )) || return
    local -a loc
    loc=(${(@M)$(locale -a 2>/dev/null):#*.(utf|UTF)(-|)8}) || return
    (( $#loc )) || return
    typeset -g __p9k_locale=${loc[(r)(#i)C.UTF(-|)8]:-${loc[(r)(#i)en_US.UTF(-|)8]:-$loc[1]}}
  fi
  [[ -n $__p9k_locale ]]
}

() {
  eval "$__p9k_intro"
  if (( $+__p9k_sourced )); then
    (( $+functions[_p9k_setup] )) && _p9k_setup
    return 0
  fi
  typeset -gr __p9k_dump_file=${XDG_CACHE_HOME:-~/.cache}/p10k-dump-${(%):-%n}.zsh
  if [[ $__p9k_dump_file != $__p9k_instant_prompt_dump_file ]] && (( ! $+functions[_p9k_preinit] )) && source $__p9k_dump_file 2>/dev/null && (( $+functions[_p9k_preinit] )); then
    _p9k_preinit
  fi
  typeset -gr __p9k_sourced=13
  if [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]]; then
    if [[ -w $__p9k_root_dir && -w $__p9k_root_dir/internal && -w $__p9k_root_dir/gitstatus ]]; then
      local f
      for f in $__p9k_root_dir/{powerlevel9k.zsh-theme,powerlevel10k.zsh-theme,internal/p10k.zsh,internal/icons.zsh,internal/configure.zsh,internal/worker.zsh,internal/parser.zsh,gitstatus/gitstatus.plugin.zsh,gitstatus/install}; do
        [[ $f.zwc -nt $f ]] && continue
        zmodload -F zsh/files b:zf_mv b:zf_rm
        local tmp=$f.tmp.$$.zwc
        {
          # `zf_mv -f src dst` fails on NTFS if `dst` is not writable, hence `zf_rm`.
          zf_rm -f -- $f.zwc && zcompile -R -- $tmp $f && zf_mv -f -- $tmp $f.zwc
        } always {
          (( $? )) && zf_rm -f -- $tmp
        }
      done
    fi
  fi
  builtin source $__p9k_root_dir/internal/p10k.zsh || true
}

(( $+__p9k_instant_prompt_active )) && unsetopt prompt_cr prompt_sp || setopt prompt_cr prompt_sp

(( ${#__p9k_src_opts} )) && setopt ${__p9k_src_opts[@]}
'builtin' 'unset' '__p9k_src_opts'


### Bind keys
#############
autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

### Source plugins
##################
# source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# source ~/.config/broot/launcher/bash/br 2>/dev/null

# if [ -f /home/bruce/.config/broot/launcher/bash/br ]; then
#    source /home/bruce/.config/broot/launcher/bash/br 2>/dev/null
# fi

####### Additions
 if [ -f ~/.zsh_aliases ]; then
   . ~/.zsh_aliases
 fi

 if [ -f ~/.bash_aliases ];then
    . ~/.bash_aliases
 fi
