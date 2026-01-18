# VS Code PowerShell profile script
# Call the Standard PowerShell profile
$mydocuments = [environment]::getfolderpath("mydocuments")
. "$mydocuments\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"