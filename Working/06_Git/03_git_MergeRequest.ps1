
#In den Ordner wechseln(falls nicht schon erledigt)
Set-Location C:\Temp\Testprojekt_02 

#Checkout des Projekte sund Erstellen eines Clones
git checkout –b feature_test

########################################################
#Problem beheben, Ergänzung machen oder neue Feature implementieren
########################################################

#Änderungen von lokalen Arbeitsbereich in Instanz übertragen
Git add .

#Commit machen
git commit –am "Neue Funktion"

#
git push