# Define variables
$gitInstallCommand = "winget install --id Git.Git --source winget"
$neofetchRepoUrl = "https://github.com/dylanaraps/neofetch.git"
$neofetchDir = Join-Path $env:USERPROFILE "neofetch"
$neofetchShimPath = Join-Path $env:USERPROFILE "neofetch.cmd"
$gitBashPath = "C:\Program Files\Git\bin\bash.exe"

# Install Git
Write-Host "Installing Git using winget..."
Invoke-Expression $gitInstallCommand

# Check if Git was installed successfully
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git installation failed. Please ensure winget is installed and try again."
    exit 1
}

# Clone the neofetch repository
Write-Host "Cloning the neofetch repository..."
git clone $neofetchRepoUrl $neofetchDir

# Check if the clone was successful
if (-not (Test-Path $neofetchDir)) {
    Write-Host "Failed to clone neofetch repository. Please check the repository URL or your network connection."
    exit 1
}

# Create a shim to run neofetch
Write-Host "Creating neofetch shim..."
$shimContent = @"
@echo off
"$gitBashPath" "$neofetchDir\neofetch" %*
"@

# Write the shim content to a .cmd file
Set-Content -Path $neofetchShimPath -Value $shimContent

# Check if the shim was created successfully
if (-not (Test-Path $neofetchShimPath)) {
    Write-Host "Failed to create neofetch shim. Please check your permissions."
    exit 1
}

# Update PATH environment variable
Write-Host "Updating PATH environment variable..."
$directoryToAdd = [System.IO.Path]::GetDirectoryName($neofetchShimPath)
$currentPath = [System.Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
if ($currentPath -notlike "*$directoryToAdd*") {
    $newPath = "$currentPath;$directoryToAdd"
    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, [System.EnvironmentVariableTarget]::User)
}

Write-Host "Installation and setup complete! You can now run 'neofetch' from Command Prompt."
