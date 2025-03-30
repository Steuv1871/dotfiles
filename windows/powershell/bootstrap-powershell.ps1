# PowerShell config bootstrap
# Symlink for Windows PowerShell profile
$source = "$PSScriptRoot\WindowsPowerShell"
$destination = Split-Path -Parent $PROFILE

# Check if the destination exists and rename it if it does
if ((Test-Path -Path "$destination")) {
    Rename-Item -Path $destination -NewName "$($destination).bck"
}

# Create the symbolic link with elevated privileges
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `& { New-Item -ItemType SymbolicLink -Path $destination -Target $source }" -Verb RunAs