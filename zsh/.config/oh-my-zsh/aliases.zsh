#######################
# Aliases declaration #
#######################
alias please='sudo'

# ░█▀▀░█░█░█▀█░█▀▄░▀█▀░█░█░█▀█░█▀█░█▀▄
# ░▀▀█░█▀█░█░█░█▀▄░░█░░█▀█░█▀█░█░█░█░█
# ░▀▀▀░▀░▀░▀▀▀░▀░▀░░▀░░▀░▀░▀░▀░▀░▀░▀▀░
# zsh
alias zshconfig="nvim ~/.zshrc"

# Neovim
alias view=nvim -R
alias vimdiff=nvim -d

# qtile
alias vimqt="nvim ~/.config/qtile/config.py"
alias qtdebug="tail ~/.local/share/qtile/qtile.log" # Add -n X to display X lines
alias startw="qtile start -b wayland" # Launch Qtile with wayland backend

# Dotfile
alias dot="cd ~/.dotfiles"
alias todo="nvim ~/.dotfiles/TODO.md"
alias installed="nvim ~/.dotfiles/installed.sh"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# tar
alias tarnow='tar -acf '
alias untar='tar -zxvf '

# dir
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# Common use
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias pacclean='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'
alias jctl="journalctl -p 3 -xb" # Get the error messages from journalctl

# ░█▀▀░█▀█░█░█░█▀█░█▀█░█▀▀░█▀▀░█▀▄
# ░█▀▀░█░█░█▀█░█▀█░█░█░█░░░█▀▀░█░█
# ░▀▀▀░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀░
# color grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

#color for man
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Neofetch
alias neofetch="fastfetch"
alias gayfetch="hyfetch -b fastfetch"

# ░▀█▀░█░█░▀█▀░█▀▄░█▀▄░░░░░█▀█░█▀█░█▀▄░▀█▀░█░█
# ░░█░░█▀█░░█░░█▀▄░█░█░▄▄▄░█▀▀░█▀█░█▀▄░░█░░░█░
# ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀░░░░░░▀░░░▀░▀░▀░▀░░▀░░░▀░
# bat (if installed)
if [ -x "$(command -v batcat)" ]; then
    alias bat='batcat'
    #command -v bat > /dev/null && alias cat='bat --pager=never'
    #command -v bat > /dev/null && alias less='bat'
    # Color help output
    alias bathelp='bat --plain --language=help'
    help() {
        "$@" --help 2>&1 | bathelp
    }
    alias cat='bat --style header --style snip --style changes --style header'
fi

# Colorls (if installed)
if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

# exa (if installed)
if [ -x "$(command -v exa)" ]; then
    alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
    alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --icons'  # long format
    alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
fi

# Mcfly (if installed)
if [ -x "$(command -v mcfly)" ]; then
    export MCFLY_FUZZY=true
    export MCFLY_RESULTS=20
    export MCFLY_INTERFACE_VIEW=BOTTOM
    export MCFLY_RESULTS_SORT=LAST_RUN
    eval "$(mcfly init zsh)"
fi

# thefuck (if installed)
if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

# ugrep (if installed)
if [ -x "$(command -v ugrep)" ]; then
    alias grep='ugrep --color=auto'
    alias fgrep='ugrep -F --color=auto'
    alias egrep='ugrep -E --color=auto'
fi

