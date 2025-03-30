# ░█▀▀░▀█▀░█▀█░█▀▄░█▀▀░█░█░▀█▀░█▀█
# ░▀▀█░░█░░█▀█░█▀▄░▀▀█░█▀█░░█░░█▀▀
# ░▀▀▀░░▀░░▀░▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░░
function Invoke-Starship-TransientFunction {
    # &starship module time
    "$(&starship prompt --profile transient) "
}

$ENV:STARSHIP_CONFIG = "$HOME\.dotfiles\starship\.config\starship.toml"
Invoke-Expression (&starship init powershell)

# Enable-TransientPrompt

# ░█░█░█░█
# ░█░█░▀▄▀
# ░▀▀▀░░▀░
# Shell completion
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
