# Keychain pour la sauvegarde 
pacman -S keychain

# Debugedit, nécessaire pour la compilation de certains paquets (ex: conky-cli)

# Permet d'obtenir les code des touches à utiliser par exemple sur la config de hyperland
pacman -S wev

# Optimus Management --> non installé, pas compatible avec Wayland
#pacman -S optimus-management-git

# Varitety (Wallpaper management)
sudo pacman -S swaybg variety

### Conky
sudo pacman -S conky 
# Programs for modules
sudo pacman -S acpi

### Neofetch replacement
sudo pacman -S hyfetch fastfetch

### RDP session manager
sudo pacamn -S freerdp2

### Nuclear
sudo pacma -S nuclear-player

### SDDM Theme
sudo pacman -S sddm-theme-astronaut
# sudo vim /etc/sddm.conf
# ---
# [Theme]
# Current=astronaut
