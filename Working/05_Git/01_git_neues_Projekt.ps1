#Ordner erstellen, bsp. C:\Temp\Testprojekt_02
New-Item -ItemType Directory -Name C:\Temp\Testprojekt_02

#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\Testprojekt_02

#Git in diesem Ordner initiieren(.git Ordner wird erstellt)
git init

#Remote Git Verzeichniss mit lokalen Ordner verknüpfen
git remote add origin https://siegenthalda@git.pnet.ch/siegenthalda/Testprojekt_02.git

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
git add .

#Commit machen
git commit -m "Initial commit"

#
git push -u origin master