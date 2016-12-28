# Grabs the directory that the script is running from
$profile_path = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Load longer form functions
if(Test-Path $profile_path\Functions) {
  Resolve-Path $profile_path\Functions\*.ps1 | % { . $_.ProviderPath }
}

# Single line shortcuts I use on a regular basis
function gh() { Set-Location $env:USERPROFILE }
function gd() { Set-Location ($env:USERPROFILE + "\Documents\Dev") }
function ggh() { Set-Location ($env:USERPROFILE + "\Documents\GitHub") }
# Close PowerShell
function x() { exit }
# Open current directory in explorer
function e() { start . }
# *nixy things
function touch([Parameter(Mandatory=$true)]$file) { set-content -Path $file -Value ($null) }
function reboot() { shutdown -r -t 1 }
function halt() { shutdown -s -t 1 }

# Launch Microsoft Visual Studio Code
Set-Alias -name c -value code
# Mmmm, grep
Set-Alias -name grep -value Select-String

# Colors
$console = $host.UI.RawUI
$console.ForegroundColor = "White"
$console.BackgroundColor = "Black"

# Add posh-git from GitHub Shell to PowerShell
. (Resolve-Path "$env:LOCALAPPDATA\GitHub\shell.ps1")
. $env:github_posh_git\profile.example.ps1

# Or if you installed into Modules
#Import-Module posh-git
#. $profilePath\Modules\posh-git\profile.example.ps1

# Custom prompt
function global:prompt {
    Write-Host ("[") -nonewline -foregroundcolor DarkGray
    Write-Host ((split-path($PWD) -Leaf)) -nonewline -foregroundcolor Gray
    Write-Host ("]") -nonewline -foregroundcolor DarkGray

    Write-VcsStatus

    Write-Host ("#") -nonewline -foregroundcolor Green
    return " "
}

# Clear to set colors
Clear-Host