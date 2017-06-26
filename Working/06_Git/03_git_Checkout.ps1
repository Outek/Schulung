
#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\Git\TestProjekt_Sigi

#Checkout des Projekte sund Erstellen eines Clones
git checkout -b feature_x

#Kontrolle in welchem Branch ich mich befinde
git status

###################################################################
#Problem beheben, Ergänzung machen oder neue Feature implementieren
###################################################################

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
git add .

#Commit machen
git commit -am "Neue Funktion"

#Änderungen in das remote Git Verzeichnis pushen
git push

#Wechseln in den master branch
git checkout master

#Die beiden Branches (feature_x und master) zusammenführen
git merge feature_x

#Branch feature_x löschen
git branch -d feature_x

#Kontrolle, in welchem Branch ich mich befinde
git status