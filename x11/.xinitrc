#!/bin/bash

# Execute on penkesu
if [ "$(hostname)" = "rpiz2" ] || [ "$(hostname)" = "penkesu" ]; then
    # Rotate screen
    xrandr --output HDMI-1 --rotate right

    # Start Qtile Window Manager
    exec $HOME/.local/bin/qtile start

    # Start touch screen
    exec touchegg

    # Hide mouse cursor
    # TODO
fi


