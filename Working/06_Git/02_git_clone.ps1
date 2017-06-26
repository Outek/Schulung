#Verzeichnis löschen
Remove-Item -Path C:\Temp\Git\TestProjekt_Sigi -Recurse -Force

#Git Pfad
Set-Location C:\Temp\Git\

#Git Repo clonen, um die Daten wieder herzustellen
git clone https://github.com/PFTestuser01/TestProjekt_Sigi.git

#Pfad in Git Verzeichnis anpassen
Set-Location C:\Temp\Git\TestProjekt_Sigi

#Neuer Eintrag machen im Testfile
Set-Content -Value "Noch ein Eintrag von Sigi" -Path C:\Temp\Git\TestProjekt_Sigi\Test_Sigi.txt

#Änderungen hinzufügen
git add .

#Commit
git commit -am "Noch ein Eintrag gemacht"

#Pushen
git push