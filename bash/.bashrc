#
# ~/.bashrc
#

# Source global definitions
if [ -f /etc/bashrc ];
   then . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Path
export PATH=/home/hayden/.bin:/home/hayden/.local/bin:$PATH

# System defaults
export BROWSER=firefox
export EDITOR=nvim
export READER=zathura
export TERMCD=st
export TERMINAL=st
export VISUAL=nvim

# Git tab completion
source git-completion.bash

# Git prompt
source git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

# PS1 prompt; git prompt is $(__git_ps1 " (%s)")
export PS1='[\u@\h \w$(__git_ps1 " (%s)")]\\$ \[$(tput sgr0)\]'

# Aliases
alias fullclean='make clean && rm -f config.h && git reset --hard origin/master'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias lg='lazygit'
alias ll='ls -l --color=auto'
alias lt='ls -lt --color=auto'
alias nnn='nnn -e'
alias notes='nvim ~/documents/notes/index.md'

# Fzf settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#282828,hl+:#fabd2f
--color info:#83a598,prompt:#ebdbb2,spinner:#fabd2f,pointer:#7daea3,marker:#a89984,header:#282828
'

# NNN settings
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;p:preview-tabbed;u:getplugs"
export NNN_COLORS="6234"
export NNN_FCOLORS="0b0c040a00060e080d070500"

# Called from bash_profile
. "$HOME/.cargo/env"
