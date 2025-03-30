# ░█▀█░█▀█░▀█▀░█░█
# ░█▀▀░█▀█░░█░░█▀█
# ░▀░░░▀░▀░░▀░░▀░▀
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
## Custom PATH
# bob
export PATH=$HOME/.local/share/bob/nvim-bin:$PATH

# ░█▀█░█░█░░░█▄█░█░█░░░▀▀█░█▀▀░█░█
# ░█░█░█▀█░░░█░█░░█░░░░▄▀░░▀▀█░█▀█
# ░▀▀▀░▀░▀░░░▀░▀░░▀░░░░▀▀▀░▀▀▀░▀░▀
# Path Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Change path to oh-my-zsh custom folder to avoid symlinking dotfiles in the oh-my-zsh folder (messed up the git repo)
ZSH_CUSTOM=~/.config/oh-my-zsh

# Set name of the theme to load as a fallback in case starship don't work
ZSH_THEME="darkblood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30 

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# ░█▀█░█▄█░▀▀█░░░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀
# ░█░█░█░█░▄▀░░░░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█
# ░▀▀▀░▀░▀░▀▀▀░░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf
aliases
zsh-autosuggestions
zsh-syntax-highlighting
kubectl
minikube
podman
postgres
python
rust
ssh
encode64
docker
# colored-man-page
uv
starship
nvims # Custom plugin for neovim config switcher
zsh-vi-mode # A better and friendly vi(vim) mode plugin for ZSH
)

# skip the verification of insecure directories as oh-my-zsh don't appreciate Windows permissions
if [ -n "$WSL_DISTRO_NAME" ]; then
    ZSH_DISABLE_COMPFIX=true
fi
source $ZSH/oh-my-zsh.sh



# ░█▀▀░▀█▀░█▀█░█▀▄░█▀▀░█░█░▀█▀░█▀█
# ░▀▀█░░█░░█▀█░█▀▄░▀▀█░█▀█░░█░░█▀▀
# ░▀▀▀░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░░
# eval "$(starship init zsh)" # starship is now managed by oh-my-zsh plugin

# ░█░█░█▀▀░█▀▀░█▀▄░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█
# ░█░█░▀▀█░█▀▀░█▀▄░░░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█
# ░▀▀▀░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀
# Unbloated from ~/.zshrc to ~/.config/oh-my-zsh/zshConfig.zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension.
# For a full list of active aliases, run `alias`.

# Functions déclarations from .zsh_functions/
fpath+=~/.zsh_functions

## Run neofetch if not in VSCode
if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    ## Run neofetch
    fastfetch --disable-linewrap
fi