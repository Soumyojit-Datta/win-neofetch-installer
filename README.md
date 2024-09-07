# Windows Neofetch Installer

This repository provides an installer script for `neofetch` on Windows, allowing you to run the popular system information tool natively from Command Prompt. This script handles the installation of Git using `winget`, clones the `neofetch` repository, and sets up a shim to enable running `neofetch` from the command line.

## Features

- Installs Git using `winget` if not already installed.
- Clones the `neofetch` repository from GitHub.
- Creates a Windows command shim to run `neofetch` from Command Prompt.
- Updates the `PATH` environment variable to include the directory containing the shim.

## Prerequisites

- **Windows Operating System**: The script is designed for Windows environments.
- **PowerShell**: The script is a PowerShell script, and it should be executed in PowerShell.
- **winget**: Windows Package Manager must be installed for Git installation. It comes pre-installed on Windows 10 (build 1809 and later).

## Installation Instructions

1. **Download the Script:**

   Download the `install-neofetch.ps1` script from this repository.

2. **Run PowerShell as Administrator:**

   Right-click on the PowerShell icon and select "Run as Administrator" to ensure you have the necessary permissions.

3. **Execute the Script:**

   Navigate to the directory where you downloaded the `install-neofetch.ps1` script and run the following command:

   ```powershell
   .\install-neofetch.ps1

