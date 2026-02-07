from libqtile import bar, widget
from tools import intermediate_color
from widget import Widgets

def initBar(colors, params):
    widgets = Widgets(params)
    pwrln_symb_left  = "\uE0B0"
    pwrln_symb_right = "\uE0C7 "
    pwrln_symb_size_left  = 35
    pwrln_symb_size_right = 20

    bg=colors['pwrline_dark']
    fg=colors['pwrline_light']

    widgets_list = []

    # Zone left
    widgets_list.append(widgets.wStartMenu(bg=bg, fg=fg))
    widgets_list.append(widget.TextBox(pwrln_symb_left, padding=0, fontsize=pwrln_symb_size_left, background=fg, foreground=bg))
    fg, bg = bg, fg
    
    widgets_list.append(widgets.wLayout(bg=bg, fg=fg))
    widgets_list.append(widgets.wGroupBox(bg=bg, fg=fg, focused=colors['winFocus']))    
    widgets_list.append(widgets.wPrompt(bg=bg, fg=colors['spawn_text']))

    # Spacer left
    widgets_list.append(widget.Spacer(lenght=bar.STRETCH, background=bg))

    # Clock and decoration
    fg, bg = bg, fg
    widgets_list.extend([
        widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left,
        background=fg,
        foreground=intermediate_color(fg, bg, 0.3)
        ),
        widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left, 
        background=intermediate_color(fg, bg, 0.3),
        foreground=intermediate_color(fg, bg, 0.6)
        ),
        widget.TextBox("\uE0BA", padding=0, fontsize=pwrln_symb_size_left, 
        background=intermediate_color(fg, bg, 0.6),
        foreground=bg
        )
    ])
    widgets_list.append(widget.Clock(
        format='%H:%M:%S',
        background = bg,
        foreground = fg
        )   
    )
    widgets_list.extend([
        widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
        background=intermediate_color(fg, bg, 0.6),
        foreground=bg
        ),
        widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
        background=intermediate_color(fg, bg, 0.3),
        foreground=intermediate_color(fg, bg, 0.6)
        ),
        widget.TextBox("\uE0BC", padding=0, fontsize=pwrln_symb_size_left, 
        background=fg,
        foreground=intermediate_color(fg, bg, 0.3),
        )
    ])
    fg, bg = bg, fg

    # Spacer right
    widgets_list.append(widget.Spacer(lenght=bar.STRETCH, background=bg))

    # Zone right
    fg, bg = bg, fg
    widgets_list.append(widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=fg, foreground=bg))
    #widgets_list.append(widgets.wWlan(bg=bg, fg=fg))
    fg, bg = bg, fg
    widgets_list.append(widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=fg, foreground=bg))
    #widgets_list.extend(widgets.wVolume(bg=bg, fg=fg))
    widgets_list.append(widgets.wBacklight(bg=bg, fg=fg))
    fg, bg = bg, fg
    widgets_list.append(widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=fg, foreground=bg))
    widgets_list.append(widgets.wBattery(bg=bg, fg=fg))
    fg, bg = bg, fg
    widgets_list.append(widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=fg, foreground=bg))
    widgets_list.append(
        widgets.wCpuTemp(bg=bg, fg=fg,
                         fg_high=intermediate_color(colors['pwrline_text_light'], 'ffaa00', 0.3),
                         fg_crit=intermediate_color(colors['pwrline_text_light'], 'ff0000', 0.3))
    )
    fg, bg = bg, fg
    widgets_list.append(widget.TextBox(pwrln_symb_right, padding=0, fontsize=pwrln_symb_size_right, background=fg, foreground=bg))
    widgets_list.append(widgets.wQuickExit(bg=bg, fg=fg))

    return bar.Bar(
        widgets_list,
        24,
        margin=[2,5,2,5],
        opacity=0.9,
    )
