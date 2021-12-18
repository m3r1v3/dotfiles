#
# ~/.bashrc
#

# merive_ configurations
# Add this next lines in your .bashrc file

# Alias configuration
alias py="python3"
alias ll="ls -l"
alias l.="ls -al"

alias update="sudo pacman -Syu"
alias shutnow="shutdown now"
alias spotify="flatpak run com.spotify.Client > /dev/null"

# Cursor configuration
printf '\e[4 q'

# Spicetify
export SPICETIFY_INSTALL="/home/merive/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# Scripts
export SCRIPTS="/home/merive/Code/Bash"
export PATH="$SCRIPTS:$PATH"

# Starship configuration
eval "$(starship init bash)"

clear
