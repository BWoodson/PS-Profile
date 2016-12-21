# Grabs the directory that the script is running from
$profilePath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Load longer form functions
# https://github.com/scottmuc/poshfiles/blob/master/Microsoft.PowerShell_profile.ps1
Resolve-Path $profilePath\Functions\*.ps1 | % { . $_.ProviderPath }

# Shortcuts I use on a regular basis
function gh() { Set-Location $env:USERPROFILE }
function gd() { Set-Location ($env:USERPROFILE + "\Documents\Dev") }
function ggh() { Set-Location ($env:USERPROFILE + "\Documents\GitHub") }
function x() { exit }
function reboot() { shutdown -r -t 1 }
function halt() { shutdown -s -t 1 }

# Launch Microsoft Visual Studio Code
New-Alias -name c -value code

# Colors
$console = $host.UI.RawUI
$console.ForegroundColor = "White"
$console.BackgroundColor = "Black"

# Add posh-git from GitHub Shell to PowerShell
# http://stackoverflow.com/questions/12504649/how-to-use-posh-git-that-comes-with-github-for-windows-from-custom-shell
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
. $env:github_posh_git\profile.example.ps1

# Clear to set colors
Clear-Host