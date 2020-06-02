#!/bin/sh

# search for folders and then open them in dolphin 
# (file browser)
# It is recommended to use a .fdignore file or to
# limit the (search) area.

#search area:
area="$HOME"
cd $area || exit

dolphin $(fd . -t d | dmenu -l 30 -i) 
