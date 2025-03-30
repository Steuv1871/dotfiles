#!/bin/env bash
# Install sddm themes and config

## Copy sddm theme
sudo cp -r ~/.config/sddm/themes /usr/share/sddm/themes/

## Copy faces
sudo cp -r ~/.config/sddm/faces /usr/share/sddm/faces/

## Copy sddm config
sudo cp ~/.config/sddm/sddm.conf /etc/sddm.conf
