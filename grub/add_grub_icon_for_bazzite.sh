#!/bin/env bash
# Add grub_class to ostree entries in boatloader if none
# Inspired by https://codeberg.org/TomaszDrozdz/Fedora-Silverblue-rpm-ostree-generate-grub-theme-icon-class 
# and https://codeberg.org/randogoth/bluefin-icons

## Check if sudo
# Source - https://stackoverflow.com/a
# Posted by Nathan, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-26, License - CC BY-SA 4.0
if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi

## Modify bootloader entries
# Parse each files in /boot/loader/entries
entries_dir="/boot/loader/entries"

for f in "$entries_dir"/ostree-*.conf "$entries_dir"/*-ostree-*.conf; do
  [ -f "$f" ] || continue

  # Already a grub_class? skip
  if grep -q 'grub_class' "$f"; then
    continue
  fi
  echo "Modified entry: $f"
  echo "grub_class fedora" | sudo tee -a $f
done;