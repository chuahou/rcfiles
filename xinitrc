#!/usr/bin/env bash

# load Xresources
xrdb -merge $HOME/.Xresources

# run configuration
xconfig.sh

# export variables for fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# run i3
exec i3
