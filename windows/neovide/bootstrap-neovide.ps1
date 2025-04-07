# Neovide config bootstrap
# Symlink for Neovide config
$source = "$PSScriptRoot\neovide"
$destination = "$HOME\AppData\Roaming\neovide"

# Function to check if a directory is a symbolic link
function Test-ReparsePoint([string]$path) {
    $file = Get-Item $path -Force -ea SilentlyContinue
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
    }

# Create a symbolic link if the profile is not already a symbolic link
if (-not (Test-ReparsePoint($destination))) {
    # Check if the destination exists and rename it if it does
    if ((Test-Path -Path "$destination")) {
        Rename-Item -Path $destination -NewName "$($destination).bck"
    }

    # Create the symbolic link with elevated privileges
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `& { New-Item -ItemType SymbolicLink -Path $destination -Target $source }" -Verb RunAs
}

