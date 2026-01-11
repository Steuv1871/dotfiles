# ░█░█░█▀▀░█░░
# ░█▄█░▀▀█░█░░
# ░▀░▀░▀▀▀░▀▀▀
# WSL specific configuration
if [ -n "$WSL_DISTRO_NAME" ]; then
    # Neovide alias to launch the Windows executable.
    win_user="$(cmd.exe /C 'echo %USERNAME%' | tr -d '\r')"
    alias neovide="/mnt/c/Users/$win_user/scoop/shims/neovide.exe"
fi