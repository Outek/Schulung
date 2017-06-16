
#Go to www.github.com
#Search for "outek" , switch to users

#download zip file, save and unzip it somewhere..
https://github.com/Outek/Schulung

#Set ExecutionPolicy
Set-ExecutionPolicy Unrestricted

#install chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#close powershell, open new session as admin

#install vscode, vscode_powershell extension for vscode, chrome, git
choco install visualstudiocode git googlechrome vscode-powershell -y

#open visual studio code
#activate powershell extension, click on reload to activate the extension

#activate integtrated terminal
# go to "view", click on integrated terminal

#click on customize, chose powershell.exe
#git clone https://github.com/Outek/Schulung.git
#click on "open folder", choose path of the downloaded and unzipped folder from git
#C:\Temp\Schulung

#Zeitrahmen
#Dsc 1,5h
    #- LCM
    #- Test & Ausprobieren
    #- Pull/Push Server

#Git 1h
    #- Neues Repo erstellen
    #- Fork/Clone
    #- Push/Pull/Merge

#Pipelines 0,5h
    #- Überblick

#Demo Pipeline 0,5h
    #- Demo Pipeline

#Offene Diskussion(freiwillig) 13:00-15:00