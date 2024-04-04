# Bootstrap
For Garuda Hyperland (Arch)

## Manual part to clone dotefiles
### Create SSH keys
```bash
mkdir .ssh && cd .ssh
ssh-keygen -t rsa -C "[my mail]"
cd ~
```

#### Add SSH key to GitHub
# Install GitHub Cli
```bash
sudo pacman -S github-cli 
``` 
# Login
```bash
gh auth login
```
> Choices:  
> \>GitHub  
> \>HTTPS  
> \>Token (follow instructions, generate token for 7 days with full permissions)

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
```

### Clone dotefiles
```bash
gh repo clone Steuv1871/dotfiles ~/.dotfiles
cd ~/.dotfiles
git checkout ["machine's branch"]
```

## Automated part
### Bootstrap
Install environement

### Utilities
Install additional tools