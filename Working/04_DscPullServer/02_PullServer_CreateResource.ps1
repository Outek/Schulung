Configuration FolderConfig
{
    Param(
    [Parameter(Mandatory=$True)]
    [String[]]$ConfigurationName
    )

    Import-DscResource -ModuleName "PSDesiredStateConfiguration"

    Node $ConfigurationName
    {
        #Erstellt einen Test Ordner
        File CreateDir_Sysapps
        {
            DestinationPath = "C:\SYSAPPS"
            Type            = "Directory" 
            Ensure          = "Present"  
        }
    }
}

#Löscht alle vorhandenen Konfigurationen
(Get-ChildItem -Path "C:\Temp\DSCService\mof_files" | Where-Object {$_.Name -Like "FolderConfig*"}) | Remove-Item

#Erstellt die neue Konfiguration
FolderConfig -ConfigurationName FolderConfig -OutputPath "C:\Temp\DSCService\mof_files"

#Checksumme erstellen
#A configuration MOF file needs to be paired with a checksum file so that an LCM on a target node can validate the configuration.
New-DscChecksum -Path "C:\Temp\DSCService\mof_files"