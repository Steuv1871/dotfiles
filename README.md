# Stevu1871's Dotfiles
My cross system dotfiles using [Stow](https://www.gnu.org/software/stow/)  
by @Steuv1871

Structure inspired by [@xero](https://github.com/xero/dotfiles)  

[More info on dotefiles](https://dotfiles.github.io/)

Used on the following systems:
- Windows 10 (Desktop)
- Debian/Ubuntu (WSL)
- Garuda (Laptop)
- Atlas OS (Laptop)
- Raspberry Pi OS (RPi Zero 2)
- Armbian (Banana Pi Zero)
- Android (termux)

## Structure
All folders are stow packages  
Exept system specific configs which are in there OS name

## Installation
Clone the repo and sync submodules
```bash
git clone --recurse-submodules https://github.com/Steuv1871/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
Stow needed packages
```stow
stow <package name>
```
### Gain Read/write permissions
Generate a personnal access token (PAT) from [github developper settings](https://github.com/settings/personal-access-tokens) with access to the `dotefiles` repo.

```bash
cd ~/.dotfiles
git remote set-url origin https://oauth2:<oauth-key-goes-here>@github.com/Steuv1871/dotfiles.git
```
> [!TIP] For machines that can't run a proper Internet Navigator to get the PAT, connect to that machine with SSH.
> On target machine with Systemd OS:
> ```bash
> sudo systemctl enable ssh
> sudo systemctl start ssh
> ```


### Specific
Specific complementary action needed.
Mostly execution permission on scripts.
#### Conky
```bash
stow ~/.dotfiles/conky
chmod +x ~/.config/conky/conky-launch.sh
```

#### SDDM
```bash
stow ~/.dotfiles/sddm
chmod +x ~/.config/sddm/config-sddm.sh
bash "~/.config/sddm/config-sddm.sh"
```
#### Windows 10



## Manual sync
Somes infos are not linked from dotfiles and need to be manually sync.
### Windows 10
TODO: Create sync script