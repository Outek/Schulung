Configuration Server 
{
    Node ServerConfig 
    {
        File PullFolder 
        {
            DestinationPath = "C:\Temp\Pullfolder"
            Type = 'Directory'
            Ensure = 'Present'
        }
    }
}

#Mof File erstellen
Server -OutputPath C:\Temp\

#Checksumme erstellen
new-dscchecksum -path C:\Temp\