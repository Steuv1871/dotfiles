# ░█░█░█░█
# ░█░█░▀▄▀
# ░▀▀▀░░▀░

# Shell completion
if [ -x "$(command -v uv)" ]; then
    eval "$(uv generate-shell-completion zsh)"
    eval "$(uvx --generate-shell-completion zsh)"
fi