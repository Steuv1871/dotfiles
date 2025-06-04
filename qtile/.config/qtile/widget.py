#!/usr/bin/python3
import subprocess
import os

def battery(power_supply='BAT0'):
    charge = subprocess.run(
        ["cat","/sys/class/power_supply/"+power_supply+"/capacity"],
capture_output=True,
        text=True,
    ).stdout.replace("\n","")
    charging_raw = subprocess.run(
        ["cat","/sys/class/power_supply/"+power_supply+"/status"],
        capture_output=True,
        text=True,
    ).stdout.replace("\n","")
    charging = 1 if charging_raw == 'Charging' else 0
    return battery_icon(charge=int(charge), charging=charging) + charge + "%"
    

def battery_icon(charge,charging):
    icon={
        100:('0xF0079','0xF0085'),
        90 :('0xF0082','0xF008B'),
        80 :('0xF0081','0xF008A'),
        70 :('0xF0080','0xF089E'),
        60 :('0xF007F','0xF0089'),
        50 :('0xF007E','0xF089D'),
        40 :('0xF007D','0xF0088'),
        30 :('0xF007C','0xF0087'),
        20 :('0xF007B','0xF0086'),
        10 :('0xF007A','0xF089C')
    }
    closest=icon.get(charge) or icon[min(icon.keys(), key = lambda key: abs(key-charge))]
    return chr(int(closest[charging],16))

def get_backlight_device(backlight_dir = "/sys/class/backlight"):
    """
    Detects and returns the first available backlight device.
    from https://github.com/rjshkhr/dotfiles

    Returns:
        str: The name of the first available backlight device.
        None: If no backlight device is found.
    """
    if os.path.isdir(backlight_dir):
        devices = os.listdir(backlight_dir)
        if len(devices) > 0:
            return devices[0]
    return None

def get_network_interface():
    """
    Dynamically detect the network interface.
    inspired by https://github.com/rjshkhr/dotfiles

    Returns:
        str: Name of the network interface.
    """
    result = subprocess.run(["ip", "-br", "addr"], capture_output=True, text=True, check=True)
    for line in result.stdout.split("\n"):
        if "UP" in line:
            return line.split(" ")[0]
    return "wlan0"

def get_wireless_interface():
    """
    Dynamically detect the wireless network interface.
    from https://github.com/rjshkhr/dotfiles

    Returns:
        str: Name of the wireless network interface.
    """
    result = subprocess.run(["ip", "link"], capture_output=True, text=True, check=True)
    for line in result.stdout.split("\n"):
        if "wlan" in line or "wlp" in line:
            return line.split(":")[1].strip()
    return "wlan0"
