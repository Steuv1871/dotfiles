# Define parameters specific to certain machine
from libqtile import qtile
from widget import battery, get_backlight_device, get_network_interface

### Default config
TERM_X11 = "alacritty"
TERM_WAYLAND = "alacritty"
WALLPAPER = "~/Pictures/wallpapers/Wallpaper_spunk_v2_conky.png"
BATTERY = battery
CPU_TEMP = '/sys/class/thermal/thermal_zone7/temp' #find x86_pkg_temp with 'cat /sys/class/thermal/thermal_zone*/type' to get the CPU intern sensor
BACKLIGHT = get_backlight_device()
WLAN = get_network_interface()

# Wayland inputs
if qtile.core.name == "wayland":
    from libqtile.backend.wayland import InputConfig
    wl_input_rules = {
        "type:keyboard": InputConfig(kb_layout='fr'),
    }

### Penkesu
if False:
    TERM_X11 = "urxvtc"
    WALLPAPER = "~/Pictures/wallpapers-penkesu/Wallpaper_spunk.png"
    CPU_TEMP = '/sys/class/thermal/thermal_zone0/temp'
    
    # Wayland inputs
    if qtile.core.name == "wayland":
        from libqtile.backend.wayland import InputConfig
        wl_input_rules = {
        "type:keyboard": InputConfig(kb_layout='fr'),
        #"type:touch": InputConfig(calibration="0 1 0 -1 0 1 0 0 1"),
        "0712:000a WaveShare WaveShare": InputConfig(click_method='clickfinger', drag='False', tap='True', calibration="0 1 0 -1 0 1 0 0 1"), # Waveshare 7.9inch display
        #"28784:21316:Nasp Quark Plus Mouse": InputConfig(), # Quark Plus Mouse wheel with rotary encoders
    }

    # PiJuice Widget
    from pijuiceWidget import pijuiceBattery
    BATTERY = pijuiceBattery
