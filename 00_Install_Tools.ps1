
#Go to www.github.com
#Suche nach "outek" , wechseln zum Benutzer

#download zip file, auf dem Desktop speichern und entpacken
https://github.com/Outek/Schulung

#Powershell ISE als Admin starten

#Set Powershell ExecutionPolicy
Set-ExecutionPolicy Unrestricted -Force

#Installieren von Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Installieren vscode, chrome, git mit Chocolatey
choco install visualstudiocode git -y

#Wer will kann noch Google Chrome installieren
choco install visualstudiocode git googlechrome -y

#Sobald Git installiert ist 
new-item -path "C:\Temp" -ItemType Directory
Set-Location -Path "C:\Temp"

#Git Repo downloaden
git clone https://github.com/Outek/Schulung

#Visual Studio Code öffnen
#Powershell Extension installieren, reload drücken für Reload zum Aktivieren der Extension

#aktivieren des integrierten Terminals
# go to "view", klick auf Integrated Terminal

#click on customize, chose powershell.exe
#git clone https://github.com/Outek/Schulung.git
#click on "open folder", choose path of the downloaded and unzipped folder from git
#C:\Temp\Schulung

#Zeitrahmen
#Dsc 2h
    #- LCM
    #- Test & Ausprobieren
    #- Pull/Push Server

#Git 30min
    #- Neues Repo erstellen
    #- Fork/Clone
    #- Push/Pull/Merge

#Pipelines 0,5h
    #- Überblick

#Demos 1h
    #- Demo Pipeline

#Offene Diskussion(freiwillig) 13:00-15:00
