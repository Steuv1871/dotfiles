#!/bin/env bash
# Install sddm themes and config

## Copy sddm theme
sudo cp -r ~/.dotfiles/sddm/themes /usr/share/sddm/themes/

## Copy faces
sudo cp -r ~/.dotfiles/sddm/faces /usr/share/sddm/faces/

## Copy sddm config
sudo cp ~/.dotfiles/sddm/sddm.conf /etc/sddm.conf
