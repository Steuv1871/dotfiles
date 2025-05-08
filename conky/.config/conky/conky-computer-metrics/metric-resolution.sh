#!/bin/env bash

# Get screen resolution depending on Compositor
resolution="not found"
if [ $XDG_SESSION_TYPE = "wayland" ]; then
    # Wayland
    resolution=$(wlr-randr --output eDP-1 | awk '/current/{print $1}')
else
    # X11
    resolution=$(xdpyinfo | awk '/dimensions/{print $2}')
fi

echo $resolution