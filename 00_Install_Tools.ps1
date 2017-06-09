
#Download ZIP File
https://github.com/Outek/Schulung

#Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install vscode, vscode_powershell, Chrome, git
choco install visualstudiocode git googlechrome -y

#Install Dsc Modules
Find-modules -Name *DSC*

Install-Module -Name pdsc