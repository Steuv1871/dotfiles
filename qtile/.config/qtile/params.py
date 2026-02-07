# Define parameters specific to certain machine
from libqtile import qtile
import tools

# Debug functions
from libqtile.log_utils import logger

### Default config
TERM_X11 = "alacritty"
TERM_WAYLAND = "alacritty"
WALLPAPER = "~/Pictures/wallpapers/Wallpaper_spunk_v2_conky.png"
BATTERY = tools.battery
CPU_TEMP = '/sys/class/thermal/thermal_zone7/temp' #find x86_pkg_temp with 'cat /sys/class/thermal/thermal_zone*/type' to get the CPU intern sensor
BACKLIGHT = tools.get_backlight_device()
WLAN = tools.get_network_interface()

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
    BATTERY = tools.pijuiceBattery


class Params:
    def __init__(self):
        # self.term = "alacritty"
        self.term = "kitty"
        self.wallpaper = "~/Pictures/wallpapers/Wallpaper_spunk_v2_conky.png"
        self.cpu_temp = '/sys/class/thermal/thermal_zone7/temp' #find x86_pkg_temp with 'cat /sys/class/thermal/thermal_zone*/type' to get the CPU intern sensor
        self.battery_func = tools.battery
        self.backlight_device = tools.get_backlight_device()
        self.network_interface = tools.get_network_interface()

        # Wayland config
        if qtile.core.name == "wayland":
            self.wayland_params()
    
        # Penkesu config
        if False:
            self.penkesu_params()
    
    def wayland_params(self):
        from libqtile.backend.wayland import InputConfig
        self.wl_input_rules = {
            "type:keyboard": InputConfig(kb_layout='fr'),
        }

    def penkesu_params(self):
        from libqtile.backend.wayland import InputConfig
        wl_input_rules = {
        "type:keyboard": InputConfig(kb_layout='fr'),
        #"type:touch": InputConfig(calibration="0 1 0 -1 0 1 0 0 1"),
        "0712:000a WaveShare WaveShare": InputConfig(click_method='clickfinger', drag='False', tap='True', calibration="0 1 0 -1 0 1 0 0 1"), # Waveshare 7.9inch display
        #"28784:21316:Nasp Quark Plus Mouse": InputConfig(), # Quark Plus Mouse wheel with rotary encoders
        }
        
        if qtile.core.name != "wayland":
            self.term = "urxvtc"
        
        self.wallpaper = "~/Pictures/wallpapers-penkesu/Wallpaper_spunk.png"
        self.cpu_temp = '/sys/class/thermal/thermal_zone0/temp'

        # PiJuice Widget
        self.battery_func = tools.pijuiceBattery




