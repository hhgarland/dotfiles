#!/bin/zsh

#
# zprofile runs at login
#

# Path
if [ -d "/home/hayden/.bin" ] ; then
        export PATH="/home/hayden/.bin:/home/hayden/.local/bin:/home/hayden/.cargo/env:$PATH"
fi

# System defaults
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export READER="zathura"
export COLORTERM="truecolor"

# NNN settings
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="f:finder;o:fzopen;b:bookmarks;t:nmount;v:imgview;p:preview-tui;u:getplugs"
export NNN_COLORS="6234"
export NNN_FCOLORS="0b0c040a00060e080d070500"

