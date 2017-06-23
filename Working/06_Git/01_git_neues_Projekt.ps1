#Ordner erstellen, bsp. C:\Temp\Testprojekt_02
New-Item -ItemType Directory -Path C:\Temp\

#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\

#Git in diesem Ordner initiieren(.git Ordner wird erstellt)
git init

#Remote Git Verzeichniss mit lokalen Ordner verknüpfen
git remote add origin https://github.com/PFTestuser01/Testprojekt.git

#CD
Set-Location C:\Temp\

#Create File
New-Item -Path C:\Temp\Testprojekt\Test_Sigi.txt -ItemType File
Set-Content -Value "Testeintrag von Sigi" -Path C:\Temp\Testprojekt\Test_Sigi.txt

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
git add .

#Commit machen
git commit -m "Initial commit"

#Git Push
git push -u origin master