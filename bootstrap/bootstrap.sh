################################
### Unbloat Garuda
################################
sudo pacman -Rcns geany

################################
### General utilities
################################
## stow
sudo pacman -S stow

## Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## NPM
sudo pacman -S nodejs npm

################################
### Obsidian
################################
sudo pacman -S obsidian
git clone git@github.com:Steuv1871/zettelkasten ~/zettelkasten

################################
### Neovim 
################################
## Bob for version control
cargo install bob-nvim
bob use lates
## Nvim-Switcher
cargo install nvim-switcher
## NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim-nvchad
# Link NvChad as default config
ln -s ~/.config/nvim-nvchad ~/.config/nvim

