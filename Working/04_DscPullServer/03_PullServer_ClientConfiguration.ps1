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
            RegistrationKey                 = "95a5159a-df3c-448b-b2fc-27fb9d6a78f9"  
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

#Erstellt das Lkale *.mof File für den LCM
PartialConfigDemoConfigNames -OutputPath C:\Dsc

#Registration key Einfügen
#Konfiguriert den LCM mit Registration Key, Pull Server und Intervall
Set-DSCLocalConfigurationManager localhost –Path C:\Dsc –Verbose

#Aktualisiert die Konfiguration vom Pull Server
Update-DscConfiguration

#Führt eine forciertes Aktualisieren der Konfiguration aus
Start-DSCConfiguration -Wait -Force –UseExisting -Verbose