#!/bin/sh
# "Change keyboard layout in" "~/.config/hypr/hyprland.conf" " " \

yad --width=530 --height=650 \
--center \
--fixed \
--title="Garuda Hyprland Keybindings" \
--no-buttons \
--list \
--column=Key: \
--column=Description: \
--column=Command: \
--timeout=60 \
--timeout-indicator=right \
"ESC" "close this app" "" "=" "modkey" "(set mod Mod4)" \
"+enter/+t" "Terminal" "(foot)" \
"+d" "Application Menu" "(wofi)" \
"+Shift+d" "Full Launcher" "(nwggrid)" \
"+o" "" "Open Broswer" \
"+e" "" "Open Files" \
"+n" "" "Open Neovide" \
"+q" "close focused app" "(kill)" \
"Print" "screenshot" "(grimblast)" \
"Shift+Print" "screenshot region" "(grimblast)" \
"+Print" "screenshot window" "(grimblast)" \
"+Shit+V" "copy history" "(CopyQ)" \
"+Shift+e" "power-menu" "(wofi)" \
"+Shift+c" "Change wallpaper" "(wpaperd)" \
"+f" "Fullscreen" "Toggles to full screen" \
"+Shift+f" "Fake fullscreen" "Behave full screen without full screen" \
"+Shift+Spacebar" "Float" "Toggle windows to float" \
"+p" "Dwindle effect" "pseudo" \
"+j" "Dwindle effect" "toggle split" \
"+F1" "Firedragon" "Open Firedragon" \
"+F2" "Thunderbird" "Open Thunderbird" \
"+F3" "Thnuar" "Open Thunar" \
"+F4" "Code" "Open VsCodium" \
"+F5" "Github-Desk" "Open Github-desktop" \
"+F6" "gparted" "Open gparted" \
"+F7" "inkskape" "Open Inkscape" \
"+F8" "blender" "Open Blender" \
"+F9" "meld" "Open Meld" \
"+F10" "joplin-desktop" "Open joplin-desktop" \
"+F11" "snapper-tools" "Open snapper-tools" \
"+F12" "galculator" "Open galculator" \
#"+i" "Calamares" "Install Garuda Hyprland" \
"" "" "     Window closed in 60 sec."\
