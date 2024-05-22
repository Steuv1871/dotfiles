#!/bin/env bash
killall conky
# start for conky-calendar
#conky -c ~/.config/conky/conky-calendar/conky-calendar &
# start for conky-clock
conky -c ~/.config/conky/conky-clock/conky-clock &
# start for conky-exploded-view
#conky -c ~/.config/conky/conky-exploded-view/conky-exploded-view &
# start for conky-computer-metrics
conky -c ~/.config/conky/conky-computer-metrics/conky-computer-metrics &
# start for conky-weather
conky -c ~/.config/conky/conky-weather/conky-weather &
