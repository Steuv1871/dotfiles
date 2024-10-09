# Downgrade pour downgrader des packages
pacman -S downgrade

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
# Installation de la version 1.20 car 1.21 a un bug avec wayland
sudo pacman - U https://archive.archlinux.org/packages/c/conky/conky-1.20.2-2-x86_64.pkg.tar.zst

### Neofetch replacement
sudo pacman -S hyfetch fastfetch

### RDP session manager
sudo pacman -S freerdp2

### Nuclear
sudo pacman -S nuclear-player

### SDDM Theme
sudo pacman -S sddm-theme-astronaut
