#!/bin/env bash

## Installation
# Install fonts used in my conky configs
FONT_DIR="$HOME/.config/conky/fonts"
TARGET_DIR="/usr/share/fonts"

if [ -d "$FONT_DIR" ]; then
    for font in "$FONT_DIR"/*; do
        if [ ! -f "$TARGET_DIR/$(basename "$font")" ]; then
            sudo cp "$font" "$TARGET_DIR/"
            # echo "Copied $(basename "$font") to $TARGET_DIR" # debug
        fi
    done
    sudo fc-cache -f # Force font cache rebuild
else
    # echo "Font directory $FONT_DIR does not exist." # debug
    true
fi

## Execution
# comment/uncomment the "> /dev/null" to show/hide logs

# kill all previous conky instances
killall conky
# start for conky-clock
conky -c ~/.config/conky/conky-clock/conky-clock &#> /dev/null &
# start for conky-day
conky -c ~/.config/conky/conky-day/conky-day &#> /dev/null &
# start for conky-exploded-view /!\ Doesn't work withg wayland
#conky -c ~/.config/conky/conky-exploded-view/conky-exploded-view &#> /dev/null &
# start for conky-computer-metrics
conky -c ~/.config/conky/conky-computer-metrics/conky-computer-metrics &#> /dev/null &
# start for conky-weather
conky -c ~/.config/conky/conky-weather/conky-weather &#> /dev/null &