Configuration TestFolder {
    param ()
    Node Localhost 
    {
        # Create a Test File
        File CreateTestFolder
        {
            Ensure          = "Present"
            DestinationPath = "C:\DscDemo\FolderA"
            Type            = "Directory"
        }
    }
} 

#Huhn und Ei Problem ;)
#If (!(Test-Path C:\DscDemo)) { New-Item -Path C:\DscDemo -ItemType Directory }

# Create MOF Files
TestFolder -OutputPath C:\DscDemo

#Erstelltes *.mof file öffnen
notepad.exe C:\DscDemo\Localhost.mof
#Get-Content -Path C:\DscDemo\Localhost.mof

# Start DSC Configuration, Path zeigt dorthin wo das erstellt *.mof File liegt
# Verbose aktiviert den Output
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait

#Test, ob die Konfiguration dem entspricht, was erwartet wird
Test-DscConfiguration -ComputerName localhost -Detailed

#Lösche den Ordner und teste nochmal
Remove-Item -Path "C:\DscDemo\FolderA" -Force

# Es kann auch auf einen Konfiguration referenziert werden
Test-DscConfiguration -ComputerName localhost -ReferenceConfiguration C:\DscDemo\Localhost.mof -Verbose