# Conky config

## Source
Adapted from [https://github.com/Kosteron/Conky].

## Adaptation
### Auto-adapt to Compositor
In each script:
1. Declare a local variable to check if the compositor is wayland
```lua
local is_wayland = os.getenv("XDG_SESSION_TYPE") == "wayland"
```
2. Use the variable in `conky.config`
```lua
conky.config = {
    ...
    out_to_wayland = is_wayland,
    out_to_x = not is_wayland,
    ...
}
```

### conky-computer-metrics
#### interval
change some `exec` command to `execi` to avoid executing script that doesn't change much at runtime.

#### Resolution
Bash Script to adapted for wayland `metric-resolution.sh`
X11: `${exec xdpyinfo | awk '/dimensions/{print $2}'}`  
Wayland: `${exec wlr-randr --output eDP-1 | awk '/current/{print $1}'}`

### GPU
Bash Script to get GPU `metric-gpu.sh`
Command to get the model shown between `[ ]`
```sh
lspci | grep VGA | sed -n 's/.*\[\(.*\)\].*/\1/p'
```
Adapted to select 1 GPU (grep NVIDIA) on a multi GPU laptop
```sh
lspci | grep VGA | grep AMD | sed -n 's/.*\[\(.*\)\].*/\1/p'
```

### Wireless
LUA script `metric-network.lua` to get network adapter and insert it into network conky variable, using `lua_parse` and custom function from the LUA script `add_network_adapter_to`.
Bash command to retrieve active network interface:
```bash
ip -br addr | grep UP | awk '{print $1}
```
### conky-clock
Changed layout
Call to built in calendar command `cal`:
```bash
cal --color=always | sed -E 's/\x1b\[[1-9;]*m/${color1}/g; s/\x1b\[0m/${color}/g'
```
`--color=always` to get the current day colored with
`sed` replace the shell color with conky variable `${color1}`

## Launcher
Auto install needed fonts
```bash
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
```
and launch conky configs
```bash
# kill all previous conky instances
killall conky
# start for conky-clock
conky -c ~/.config/conky/conky-clock/conky-clock &
# start for conky-exploded-view
#conky -c ~/.config/conky/conky-exploded-view/conky-exploded-view &
# start for conky-computer-metrics
conky -c ~/.config/conky/conky-computer-metrics/conky-computer-metrics &
# start for conky-weather
conky -c ~/.config/conky/conky-weather/conky-weather &
```