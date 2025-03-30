#!/usr/bin/env zsh

# shell function to easly switch neovim configs.
# record last choice in config file.
# Use fzf if installed
# configs must be like ~/.config/nvim-*
# By @Steuv1871
# Inspired by @ooloth
# -------------------
# Install: Put script where you want and source it in your shell .*rc file.
# Exemple: if you use zsh, put it in your $ZSH_CUSTOM with a .zsh extention.
#           Or as a oh-my-zsh plugin in $ZSH_CUSTOM/nvims/nvims.plugin.zsh and add it to your plugins array in your .zshrc.
# /!\ it create a config file in the same directory
# -------------------
# Usage:
# $nvims
# or
# $nvims path/to/file

# Define saved state file in the same directory
nvims_path=$(dirname "$(realpath "$0")")
nvims_config="$nvims_path/nvims_config"
# Load saved state if exist
if [ -f "$nvims_config" ]; then
    source $nvims_config
fi

nvims() {
    # Check if fzf is installed and choose method
    if command -v fzf > /dev/null 2>&1; then
        nvims_choice=$(find ~/.config/nvim-* -maxdepth 0 | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border)
    else
        PS3="Choose a config: "
        select nvims_choice in ~/.config/nvim-*; do break; done
    fi

    # If no config selected, exit
    [[ -z $nvims_choice ]] && echo "No config selected" && return

    # Modify NVIM_APPNAME env variable and save it
    echo "export NVIM_APPNAME=$(basename $nvims_choice)" > $nvims_config
    source $nvims_config

    # Launch nvim if a file is provided
    if [ ! $# -eq 0 ] ; then nvim $@ ; fi
}