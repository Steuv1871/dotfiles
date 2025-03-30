# Launch script in each Windows "package" to link config files in the right place.

# Loop through each directory in the current script directory
Get-ChildItem -Path $PSScriptRoot -Directory | ForEach-Object {
    $dir = $_.FullName
    # Find the bootstrap script in the directory
    $bootstrapScript = Get-ChildItem -Path $dir -Filter 'bootstrap*.ps1' -File
    if ($bootstrapScript) {
        # Execute the bootstrap script
        Write-Host "Executing bootstrap script: $($bootstrapScript)"
        & $bootstrapScript.FullName
    }
}