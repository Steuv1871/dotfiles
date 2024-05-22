# Conky config

## Source
Adapted from [https://github.com/Kosteron/Conky].

## Adaptation
### conky-computer-metrics
#### Resolution
Adapted for wayland:  
replace `${exec xdpyinfo | awk '/dimensions/{print $2}'}`  
by `${exec wlr-randr --output eDP-1 | awk '/current/{print $1}'}`

### GPU
```sh
lspci | grep VGA | grep NVIDI | grep NVIDIA | sed 's/..:..\.. VGA compatible controller: //g' | sed 's/ Corporation//g' | sed 's/ Integrated Graphics Controller (primary)//g' | sed 's/ (rev .*)//g' | sed 's/.*\[//g' | sed 's/ \/ Max-Q\]//g'} > GPU ────────────┘
${alignr}${offset -150}< ${exec wlr-randr --output eDP-1 | awk '/current/{print $1}'
```
Adapted to select 1 GPU (grep NVIDIA) on a multi GPU laptop + clean format for my GPU (last 2 sed)

### Wireless
Changed network interface name

