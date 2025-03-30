#!/usr/bin/env bash
# Script to launch nvim from WSL with the specific NVIM_APPNAME env variable
# It will load the last choice from the nvims_config file if it exist
# By @Steuv1871

# Define nvims_config directory and file
nvims_config="/home/steuv/.config/oh-my-zsh/plugins/nvims/nvims_config"
# nvim bin path
nvim_bin="/home/steuv/.local/share/bob/nvim-bin/nvim"


if [ -f "$nvims_config" ]; then
    source $nvims_config
else
    export NVIM_APPNAME="nvim-mini"
fi

$nvim_bin "$@"