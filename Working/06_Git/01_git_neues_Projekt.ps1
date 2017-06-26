#Anmelden github.com 
#Username PFTestuser01
#Passwort ******* 

# "Start a project" - Repository Namen vergeben, bsp "TestProjekt_Sigi" - Public - "Create repository"

#Ordner erstellen, bsp. C:\Temp\Testprojekt_02
New-Item -ItemType Directory -Path C:\Temp\Git

#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\Git

#Neuer Projektordner
New-Item -ItemType Directory -Path C:\Temp\Git\TestProjekt_Sigi
Set-Location C:\Temp\Git\TestProjekt_Sigi

#Git in diesem Ordner initiieren(.git Ordner wird erstellt)
git init

#Create File
New-Item -Path C:\Temp\Git\TestProjekt_Sigi\Test_Sigi.txt -ItemType File
Set-Content -Value "Testeintrag von Sigi" -Path C:\Temp\Git\TestProjekt_Sigi\Test_Sigi.txt

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
git add .

#falls nötig Username festlegen
#git config --global user.email "daniel.siegenthaler.1@postfinance.ch"
#git config --global user.name "PFTestuser01"

#Commit machen
git commit -am "Initial commit"

#Remote Git Verzeichniss mit lokalen Ordner verknüpfen
git remote add origin https://github.com/PFTestuser01/TestProjekt_Sigi.git

#Git Push
git push -u origin master

#In git kontrollieren, ob das repo erstellt wurde