Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module .\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
# Import-Module posh-git


# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Write-Host($pwd.ProviderPath) -nonewline
    Write-Host ("[") -nonewline -foregroundcolor DarkGray
    Write-Host ((split-path($PWD) -Leaf)) -nonewline -foregroundcolor Gray
    Write-Host ("]") -nonewline -foregroundcolor DarkGray
    Write-Host ("#") -nonewline -foregroundcolor Green

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return " "
}

Pop-Location

Start-SshAgent -Quiet
