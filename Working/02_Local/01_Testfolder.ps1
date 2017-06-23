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
If(!(Test-Path C:\DscDemo)){ New-Item -Path C:\DscDemo -ItemType Directory }

# Create MOF Files
TestFolder -OutputPath C:\DscDemo
 
# Start DSC Configuration, Path zeigt dorthin wo das erstellt *.mof File liegt.
# Verbose aktiviert den Output
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait