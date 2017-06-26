[DscLocalConfigurationManager()]
Configuration PartialConfigDemoConfigNames
{
        Settings
        {
            RefreshFrequencyMins            = 30;
            RefreshMode                     = "PULL";
            ConfigurationMode               ="ApplyAndAutocorrect";
            AllowModuleOverwrite            = $true;
            RebootNodeIfNeeded              = $true;
            ConfigurationModeFrequencyMins  = 30;
        }

        ConfigurationRepositoryWeb PSDSCPullServer
        {
            ServerURL                       = "https://localhost:7001/PSDSCPullServer.svc"    
            RegistrationKey                 = "a2a270f1-f4a4-442f-854b-b3daf143db79"  
            ConfigurationNames              = @("FolderConfig")
        }     

        PartialConfiguration FolderConfig
        {
            Description                     = "FolderConfig"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]PSDSCPullServer")
            RefreshMode                     = 'Pull' 
        }
}

#Erhöht die Cachegrösse von winrm, falls nötig
#Set-WSManInstance -ValueSet @{MaxEnvelopeSizekb = "10000"} -ResourceURI winrm/config

#Auflisten der vorhin erstellen Registration ID
#Get-Content -Path C:\Temp\DscService\RegistrationKeys.txt

#Erstellt das Lkale *.mof File für den LCM
PartialConfigDemoConfigNames -OutputPath C:\Temp\DSCService\mof_files

#Registration key Einfügen
#Konfiguriert den LCM mit Registration Key, Pull Server und Intervall
Set-DSCLocalConfigurationManager localhost -Path C:\Temp\DSCService\mof_files –Verbose

#Aktualisiert die Konfiguration vom Pull Server
Update-DscConfiguration

#Führt eine forciertes Aktualisieren der Konfiguration aus
Start-DSCConfiguration -Wait -Force -UseExisting -Verbose