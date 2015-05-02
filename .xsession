#!/bin/bash

# Set up environment
[ -f ~/.environment ] && . ~/.environment

# Load custom settings (I use this on both my laptop and desktop and
# they need slightly different settings)
[ -f ~/.custom ] && . ~/.custom

# Turn bell off
xset b off

# Fix the synaptics driver
synclient MaxTapTime=0

# Desktop background
feh --bg-scale ~/.wallpaper.jpg

# Make the clipboard a little bit more sane
autocutsel -fork
autocutsel -fork -selection PRIMARY

(sleep 0.1; ssh-add) &

# Compositing manager (I like inactive windows to be just slightly transparent)
(xcompmgr &)

# Keyboard stuff
setxkbmap us -variant altgr-intl -option compose:menu,nodeadkeys
xmodmap ~/.xmodmap

exec xmonad
