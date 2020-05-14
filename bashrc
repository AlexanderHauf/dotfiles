# Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# history settings
HISTSIZE= HISTFILESIZE=
shopt -s histappend
#export HISTFILE="$XDG_DATA_HOME"/bash/bash_history
#autojump
export PROMPT_COMMAND="history -a"
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
[[ -s /home/alex/.autojump/etc/profile.d/autojump.sh ]] && source /home/alex/.autojump/etc/profile.d/autojump.sh

# refresh lines and columns after each command
shopt -s checkwinsize

# ROS URI
#export ROS_MASTER_URI='http://kitcarnuc:11311'

# Import local bashrc (specific folderlocations, ...)
[ -f ~/.config/varrc ] && . ~/.config/varrc

# Import my profile file
[ -f ~/.config/alex_profile ] && . ~/.config/alex_profile

# Import Shortcuts
[ -f ~/.config/aliases ] && . ~/.config/aliases

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
  fi
fi
# import pandoc bash_completion
[ -f ~/.config/pandoc_completion ] && . ~/.config/pandoc_completion
