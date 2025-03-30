# ░█░█░█▀▀░█░░
# ░█▄█░▀▀█░█░░
# ░▀░▀░▀▀▀░▀▀▀
# WSL specific configuration
if [ -n "$WSL_DISTRO_NAME" ]; then
    # Neovide alias to launch the Windows executable.
    alias neovide="/mnt/c/Users/Steuv/scoop/shims/neovide.exe"
fi