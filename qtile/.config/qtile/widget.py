from libqtile import qtile, widget


class Widgets:
    def __init__(self, params):
        # self.battery_func = params.battery_func
        # self.cpu_temp = params.cpu_temp
        # self.backlight = get_backlight_device()
        # self.wlan = get_network_interface()
        self.params = params

    def wStartMenu(self, bg, fg):
        return widget.TextBox(
        text="",
        fontsize=28,
        padding=8,
        background=bg,
        foreground=fg
        )

    def wLayout(self, bg, fg):
        return widget.CurrentLayoutIcon(background=bg, foreground=fg, padding=10)
        
    def wGroupBox(self, bg, fg, focused):
        return widget.GroupBox(
                    highlight_method="text", # Other options : 'block', 'line'
                    fontsize=20,
                    # this_current_screen_border=colors['winFocus'],
                    this_current_screen_border=focused,
                    disable_drag=True,
                    background=bg,
                    foreground=fg
                )

    def wPrompt(self, bg, fg):
        return widget.Prompt(background=bg, foreground=fg)
    
    def wClock(self, bg, fg):
        return widget.Clock(
            format='%H:%M:%S',
            background = bg,
            foreground = fg
        )
    
    def wWlan(self, bg, fg):
        return widget.Wlan(
            fmt=" {}",
            format="{percent:2.0%}",
            interface=self.params.network_interface,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(
                "networkmanager_denu -theme ~/.config/rofi/networkmenu.rasi"
                )
            },
            background = bg,
            foreground = fg,
        )
    
    def wVolume(self, bg, fg):
        return (widget.PulseVolume(
            emoji=True,
            emoji_list=['󰝟','󰕿','󰖀','󰕾'],
            background = bg,
            foreground = fg,
            ),
        widget.PulseVolume(
            emoji=False,
            unmute_format='{volume}',
            mute_format='00',
            background = bg,
            foreground = fg 
            ))

    def wBacklight(self, bg,fg):
        return widget.Backlight(
            fmt="󰃚 {}",
            backlight_name=self.params.backlight_device,
            background = bg, 
            foreground = fg 
            )

    def wBattery(self, bg, fg):
        return widget.GenPollText(
            name = "battery",
            fmt = "{}",
            update_interval = 60,
            func = self.params.battery_func,
            background = bg, 
            foreground = fg 
        )

    def wCpuTemp(self, bg, fg, fg_high, fg_crit):
        return widget.ThermalZone(
            zone=self.params.cpu_temp,
            fgcolor_normal = fg,
            fgcolor_high = fg_high,
            fgcolor_crit = fg_crit,
            background = bg, 
            foreground = fg, 
            fmt = "{}",
            format_crit = '{temp}°C',
            high = 70,
            crit = 85
        )

    def wQuickExit(self, fg, bg):
        return widget.QuickExit(
            default_text=" ⏻ ",
            background = bg, 
            foreground = fg 
        )

