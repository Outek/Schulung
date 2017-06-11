
#Go to www.github.com
#Search for "outek" , switch to users

#download zip file
https://github.com/Outek/Schulung

#install chocolatey
Invoke-WebRequest ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#install vscode, vscode_powershell extension for vscode, chrome, git
choco install visualstudiocode git googlechrome vscode-powershell -y

#Install Dsc Modules
Install-Module -Name 

Install-Module -Name pdsc