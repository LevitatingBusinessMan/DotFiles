#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

#PS1="\[\033[1;31m\]\$(git_branch)\[\033[36m\]\u \[\033[34m\]\w \[\033[32m\]\$\[\033[0m\] "
PS1="\[\033[1;31m\]\$(git_branch)\[\033[96m\]\u \[\033[34m\]\w \[\033[35m\]\$\[\033[0m\] "


f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

export EDITOR="/usr/bin/micro"

#fff customization
export FFF_OPENER="less"
export FFF_FAV1="${HOME}"
export FFF_FAV2="${HOME}/.bashrc"
export FFF_FAV3="${HOME}/.bash_aliases"
export FFF_FAV4="${HOME}/projects"
export FFF_FAV5="/tmp"
export FFF_COL2=6

#For dfcp
export DOT_FILES="$HOME/.bash_profile:$HOME/.bashrc:$HOME/.bash_aliases:$HOME/.xinitrc:$HOME/.config/i3:$HOME/.config/picom.conf:$HOME/.config/polybar:$HOME/.config/rofi:$HOME/.local/share/konsole:$HOME/.config/micro:$HOME/.config/dunst:$HOME/.config/replay-sorcery.conf:$HOME/config_tablet.sh:$HOME/.config/dunst/dunstrc:$HOME/.config/git-bro:$HOME/dunst_volume.sh:$HOME/.config/systemd/user:$HOME/.screenlayout:$HOME/.config/mpv:$HOME/.config/alacritty.yml:$HOME/scripts:$HOME/.customizepkg:$HOME/.config/fish"

STEAMCOMMON="${HOME}/Games/SteamLibrary/steamapps/common"

#GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

source ~/wpscan_token.sh

export HISTCONTROL="ignoredups:ignorespace"

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# bash --norc to avoid going into fish
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
then
	exec fish
fi
