#Export PATH variable for cargo
[ -d "$HOME/.cargo/bin" ] && PATH=$PATH:/home/alex/.cargo/bin

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$SCRIPTS" ] && PATH="$SCRIPTS:$PATH"

#Export standards
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="yakuake"
export DEFAULT_USER="alex"

# ~/ clean up
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave_hist"
export WGETRC="$HOME/.config/wgetrc"
