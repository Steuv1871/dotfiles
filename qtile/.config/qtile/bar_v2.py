from libqtile import bar, widget
from tools import intermediate_color
import params

def initBar(colors):
    pwrln_symb_left  = "\uE0B0"
    pwrln_symb_right = "\uE0C7 "
    pwrln_symb_size_left  = 35
    pwrln_symb_size_right = 20

    myBar = bar.Bar(
        [
            widget.TextBox(
            text="",
            fontsize=28,
            padding=8,
            background=colors['pwrline_dark'],
            foreground=colors['pwrline_light']
            ),
            widget.TextBox(pwrln_symb_left, padding=0, fontsize=pwrln_symb_size_left, background=colors['pwrline_light'], foreground=colors['pwrline_dark']),               
            widget.CurrentLayoutIcon(background=colors['pwrline_light'], foreground=colors['pwrline_dark'], padding=10),
            widget.GroupBox(
                highlight_method="text", # Other options : 'block', 'line'
                fontsize=20,
                this_current_screen_border=colors['winFocus'],
                disable_drag=True,
                background=colors['pwrline_light'],
                foreground=colors['pwrline_dark']
            ),
            #widget.TextBox(pwrln_symb_left, padding=0, fontsize=pwrln_symb_size_left, background=colors['pwrline_dark'], foreground=colors['pwrline_light']),
            #widget.Prompt(background=colors['pwrline_dark'], foreground=colors['pwrline_text_dark']),                
            #widget.TextBox(pwrln_symb_left, padding=0, fontsize=pwrln_symb_size_left, background=colors['pwrline_light'], foreground=colors['pwrline_dark']),
            widget.Prompt(background=colors['pwrline_light'], foreground=colors['spawn_text']),
            #widget.WindowName(background=colors['pwrline_light'], foreground=colors['pwrline_dark']),
            widget.Spacer(lenght=bar.STRETCH, background=colors['pwrline_light']),
            widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left, 
                            background=colors['pwrline_light'],
                            #foreground=format( int(colors['pwrline_light'],16) + int('444444',16), 'X')
                            foreground=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.3)
                            ),
            widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left, 
                            background=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.3),
                            foreground=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.6)
                            #background=format( int(colors['pwrline_light'],16) + int('444444',16), 'X'),
                            #foreground=format( int(colors['pwrline_dark'],16) - int('444444',16), 'X')
                            ),
            widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left, 
                            background=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.6),
                            #background=format( int(colors['pwrline_dark'],16) - int('444444',16), 'X'),
                            foreground=colors['pwrline_dark']
                            ),
            widget.Clock(
                format='%H:%M:%S',
                background = colors['pwrline_dark'],
                foreground = colors['pwrline_text_dark']
            ),
            widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
                            background=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.6),
                            foreground=colors['pwrline_dark']
                            ),
            widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
                            background=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.3),
                            foreground=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.6)
                            ),
            widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
                            background=colors['pwrline_light'],
                            foreground=intermediate_color(colors['pwrline_light'], colors['pwrline_dark'], 0.3),
                            ),
            widget.Spacer(lenght=bar.STRETCH, background=colors['pwrline_light']),
            #widget.Chord(
            #    chords_colors={
            #        'launch': ("#ff0000", "#ffffff"),
            #    },
            #    name_transform=lambda name: name.upper(),
            #),
            #widget.Wlan(),
            widget.Wlan(
                fmt=" {}",
                format="{percent:2.0%}",
                interface=params.WLAN,
                #foreground=colors["background"],
                mouse_callbacks={
                    "Button1": lambda: qtile.cmd_spawn(
                    "networkmanager_denu -theme ~/.config/rofi/networkmenu.rasi"
                    )
                },
                background = colors['pwrline_light'],
                foreground = colors['pwrline_text_light'],
            ),
            widget.PulseVolume(
                emoji=True,
                emoji_list=['󰝟','󰕿','󰖀','󰕾'],
                background = colors['pwrline_light'],
                foreground = colors['pwrline_text_light'],
                ),
            widget.PulseVolume(
                emoji=False,
                unmute_format='{volume}',
                mute_format='00',
                background = colors['pwrline_light'],
                foreground = colors['pwrline_text_light'],
                ),
            widget.Backlight(
                fmt="󰃚 {}",
                backlight_name=params.BACKLIGHT,
                background = colors['pwrline_light'],
                foreground = colors['pwrline_text_light'],
                ),
            widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=colors['pwrline_light'], foreground=colors['pwrline_dark']),
            widget.GenPollText(
                name = "battery",
                fmt = "{}",
                update_interval = 60,
                func = params.BATTERY,
                background = colors['pwrline_dark'],
                foreground = colors['pwrline_text_dark']
            ),
            widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=colors['pwrline_dark'], foreground=colors['pwrline_light']),
            widget.ThermalZone(
                zone=params.CPU_TEMP,
                fgcolor_normal = colors['pwrline_text_light'],
                fgcolor_high = intermediate_color(colors['pwrline_text_light'], 'ffaa00', 0.3),
                fgcolor_crit = intermediate_color(colors['pwrline_text_light'], 'ff0000', 0.3),
                background = colors['pwrline_light'],
                foreground = colors['pwrline_text_light'],
                fmt = "{}",
                format_crit = '{temp}°C',
                high = 70,
                crit = 85
            ),
            #widget.TextBox(" ", name="spacer"),
            #widget.Systray(),
            #widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=colors['pwrline_light'], foreground=colors['pwrline_dark']),
            #widget.TextBox(" ", name="spacer", background = colors['pwrline_light'], foreground = colors['pwrline_dark']),
            widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=colors['pwrline_light'], foreground=colors['pwrline_dark']),
            widget.QuickExit(
                default_text=" ⏻ ",
                background = colors['pwrline_dark'],
                foreground = colors['pwrline_text_dark']
            ),
        ],
        24,
        margin=[2,5,2,5],
        opacity=0.9,
    )

    return myBar

