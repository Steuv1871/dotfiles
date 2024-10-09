# Bootstrap
For Garuda Hyperland (Arch)

## Manual part
### Sync dotfiles
#### Create SSH keys
```bash
mkdir .ssh && cd .ssh
```
```bash
ssh-keygen -t rsa -C "[my mail]"
```
Name your key and use this name in [ssh_key]
```bash
cd ~
```

#### Add SSH key to GitHub
Install GitHub Cli
```bash
sudo yay -S github-cli 
``` 
Login
```bash
gh auth login
```
> Choices:  
> \>GitHub  
> \>HTTPS  
> \>**Token** (follow instructions, generate token for 7 days with full permissions)

```bash
gh ssh-key add ~/.ssh/[ssh_key].pub --title '[a title for the machine]'
```
Test connection
```bash
ssh -T git@github.com
```

Git config
```bash
git config --global user.email "you@example.com"
```
```bash
git config --global user.name "Your Name"
```
```bash
git config credential.helper store
```

#### Clone dotefiles
```bash
git clone git@github.com:Steuv1871/dotfiles.git ~/.dotfiles
```
```bash
cd ~/.dotfiles
```
```bash
git checkout ["machine's branch"]
```

#### Exec Bootstrap script
TODO: Script to automaticaly move default config. Until, do it manually before executing `bootstrap.sh` 
1. Check what need to be move
```bash
cd ~/.dotfiles/stow_home
```
```bash
stow * -vn
```
2. Move defaults in error
```bash
mv ~/.config/waybar ~/.config/waybar.bck
```

```bash
chmod +x ~/.dotfiles/bootstrap/bootstrap.sh
```
```bash
~/.dotfiles/bootstrap/bootstrap.sh
```
#### Post-Bootstrap
##### SDDM
Symlink doesn't work for theme and faces (sddm github issue #1973).
Need to copy /etc/sddm.conf, /usr/share/sddm/themes/* and /usr/share/sddm/faces/* from stow\_root/sddm

#### Mount Hard drives
1. `sudo pacman -S arch-install-scripts` for `genftsab`
1. `lsblk` To check disk structure and not the name (`/dev/xxxx`) of disk to mount <!-- 1. `sudo blkid` to get partition UUID to mount them -->
1. `sudo mkdir /mnt/my_drive` to create a directory for the drive to be mounted
1. `sudo mount /dev/XXX /mnt/stockage`
1. `genfstab -U / | grep my_drive | sudo tee -a /etc/fstab`

## Automated part
### Bootstrap
Install environement

### Utilities
Install additional tools
