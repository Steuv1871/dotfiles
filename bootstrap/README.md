# Bootstrap
For Garuda Hyperland (Arch)

## Manual part
### Sync dotfiles
#### Create SSH keys
```bash
mkdir .ssh && cd .ssh
ssh-keygen -t rsa -C "[my mail]"
#name your key and use this name in [ssh_key]
cd ~
```

#### Add SSH key to GitHub
Install GitHub Cli
```bash
sudo pacman -S github-cli 
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
git config --global user.name "Your Name"
git config credential.helper store
```

#### Clone dotefiles
```bash
git clone git@github.com:Steuv1871/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout ["machine's branch"]
```

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