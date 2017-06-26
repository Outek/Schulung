# Github.com öffnen, Projekt wählen, bsp. TestProjekt_Sigi

# Unter "Code" - "branch:master" anklicken, neuen Branch "development" hinzufügen 

# "2 branches" anklicken - "change default branch" wählen - "development" wählen - update   

# "Protected branches" wählen - "master" wählen - "Protect this branch" aktivieren - "Require pull request reviews before merging" aktivieren - "Save changes"

#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\Git\TestProjekt_Sigi

#Checkout des Projekte sund Erstellen eines Clones
git checkout -b feature_x

###################################################################
#Problem beheben, Ergänzung machen oder neue Feature implementieren
###################################################################

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
git add .

#Commit machen
git commit -am "Neue Funktion für merge Request"

#Wechseln in den master branch
git checkout development

#Die beiden Branches (feature_x und master) zusammenführen
git merge feature_x

#Branch feature_x löschen
git branch -d feature_x

#Änderungen in das remote Git Verzeichnis pushen
git push