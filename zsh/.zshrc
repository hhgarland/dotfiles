#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt
autoload -U colors && colors
PROMPT='[%n@%m%f %~%b]%f%% '

HISTFILE=~/.cache/zsh/history
HISTSIZE=9000
RPROMPT=\$vcs_info_msg_0_
SAVEHIST=9000
setopt promptsubst
bindkey -e

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Git settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

zstyle :compinstall filename '/home/hayden/.zshrc'

# Path
if [ -d "/home/hayden/.bin" ] ; then
        export PATH="/home/hayden/.bin:/home/hayden/.local/bin:$PATH"
fi

# System defaults
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export COLORTERM="truecolor"

# Directory colors
d=.dircolors
test -r $d && eval "$(dircolors $d)"

# Aliases
alias grep="grep --color=auto"
alias ls="ls --color -F"
alias la="ls -la --color -F"
alias ll="ls -l --color -F"
alias lt="ls -lt --color -F"
alias nnn='nnn -e'
alias notes="nvim ~/Documents/notes/index.md"
alias dwmc='cd ~/.suckless/dwm && nvim config.def.h'

# Fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#282828,hl+:#fabd2f
--color info:#83a598,prompt:#ebdbb2,spinner:#fabd2f,pointer:#7daea3,marker:#a89984,header:#282828
'

# NNN settings
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="f:finder;o:fzopen;b:bookmarks;t:nmount;v:imgview;p:preview-tui;u:getplugs"
export NNN_COLORS="6234"
export NNN_FCOLORS="0b0c040a00060e080d070500"

# tmuxp completion
eval "$(_TMUXP_COMPLETE=zsh_source tmuxp)"
