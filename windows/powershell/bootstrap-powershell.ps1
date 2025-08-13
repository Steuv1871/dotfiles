# PowerShell config bootstrap

# Function to check if a directory is a symbolic link
function Test-ReparsePoint([string]$path) {
    $file = Get-Item $path -Force -ea SilentlyContinue
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
    }

# Function to create a symbolic link if the profile is not already a symbolic link
function Add-SymbolicLink([string]$source, [string]$destination) {
    if (-not (Test-ReparsePoint($destination))) {
        # Check if the destination exists and rename it if it does
        if ((Test-Path -Path "$destination")) {
            Rename-Item -Path $destination -NewName "$($destination).bck"
            }

    # Create the symbolic link with elevated privileges
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `& { New-Item -ItemType SymbolicLink -Path $destination -Target $source }" -Verb RunAs
    }
}

$source = "$PSScriptRoot\WindowsPowerShell"
# Symlink for Windows PowerShell 5 profile
$destination = Split-Path -Parent $PROFILE
Add-SymbolicLink -source $source -destination $destination
# Symlink for Windows PowerShell 6 & 7 profile
$source = "$PSScriptRoot\PowerShell"
$destination = Split-Path -Parent $PROFILE
Add-SymbolicLink -source $source -destination $destination
