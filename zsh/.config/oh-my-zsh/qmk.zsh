# ░▄▀▄░█▄█░█░█
# ░█\█░█░█░█▀▄
# ░░▀\░▀░▀░▀░▀
# Config to compile QMK firmware

# If launched by the specific QMK Terminal entry of VS CODE, automatically activate the QMK python virtual environment
if [ "$QMK_TERMINAL" = "true" ]; then
    source ~/qmk/venv/bin/activate
fi

# Alias to activate the QMK python virtual environment
alias qmk="source ~/qmk/venv/bin/activate && echo \"python virtual environment for QMK activated, the following arguments where ignored: \""
