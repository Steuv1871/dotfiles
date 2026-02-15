#!/bin/env bash

tar -czvf astronaut.tar.gz ~/.dotfiles/sddm/themes/astronaut
echo "archive $(dirname "$0")/astronaut.tar.gz created."
echo "install it through 'System confi' > 'Colors & Themes' > 'sddm' > 󰇙 > 'Install from file'"