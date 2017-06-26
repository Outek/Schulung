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
            ServerURL                       = 'https://localhost:7001/PSDSCPullServer.svc'    
            RegistrationKey                 = '63cd3c15-824f-4cdd-87dc-ef817b9028e9'     
            ConfigurationNames              = @("RegistryConfig","FolderConfig")
        }     

        PartialConfiguration RegistryConfig
        {
            Description                     = "RegistryConfig"
            ConfigurationSource             = @("[ConfigurationRepositoryWeb]PSDSCPullServer")
            RefreshMode                     = 'Pull' 
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
PartialConfigDemoConfigNames -OutputPath C:\Temp\mof_files

#Konfiguriert den LCM mit Registration Key, Pull Server und Intervall
Set-DSCLocalConfigurationManager localhost –Path C:\Temp\mof_files\ –Verbose

#Aktualisiert die Konfiguration vom Pull Server
Update-DscConfiguration

#Führt eine forciertes Aktualisieren der Konfiguration aus
Start-DSCConfiguration -Wait -Force –UseExisting -Verbose