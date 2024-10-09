################################
### General config
################################
chsh -s $(which zsh)

################################
### Unbloat Garuda
################################
yay -Rcns geany

################################
### General utilities
################################
## stow
yay -S stow

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## NPM
yay -S nodejs npm

################################
### Obsidian
################################
yay -S obsidian
git clone git@github.com:Steuv1871/zettelkasten ~/zettelkasten

################################
### Neovim 
################################
## Bob for version control
#cargo install bob-nvim
yay -S bob
bob use latest
## NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim-nvchad
