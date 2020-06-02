#!/bin/sh

# search for files and then open a terminal application
# It is recommended to use a .fdignore file or to
# limit the (search) area.

#search area:
area="$HOME"
cd "$area" || exit

result=$(fd -H | dmenu -l 30 -i) || exit

case $result in

  *.txt|*.tex) $EDITOR "$result"
    exit ;;
  
  *.ods|*.docx) sc-im $result
    exit ;;

  *.jpg|*.jpeg|*.png|*.jpe|*.gif) gwenview $result
    exit ;;

  *.mkv|*.webm|*.mp4) vlc $result
    exit ;;

  *) dolphin $result ;;

esac
