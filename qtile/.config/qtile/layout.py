from libqtile import layout

def initLayouts(colors):
    layout_theme = {"border_width" : 2,
                    "margin" : 5,
                    "border_focus" : colors['winFocus'],
                    "border_normal" : colors['winUnfocus']
                    }

    layouts = [
        #layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
        layout.Max(**layout_theme),
        # Try more layouts by unleashing below layouts.
        # layout.Stack(num_stacks=2),
        #layout.Bsp(**layout_theme),
        layout.Matrix(**layout_theme),
        layout.MonadTall(
            # margin=5,
            # border_focus = '#CCCCCC',
            # border_normal = '#55555'
            **layout_theme
        ),
        #layout.MonadWide(),
        #layout.RatioTile(),
        #layout.Tile(),
        layout.TreeTab(**layout_theme),
        #layout.VerticalTile(),
        #layout.Zoomy(**layout_theme),
    ]

    return layouts