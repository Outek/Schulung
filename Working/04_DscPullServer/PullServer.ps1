# The Sample_MetaConfigurationToRegisterWithSecurePullServer register a DSC client node with the pull server
 
# ======================================== Arguments ======================================== #

###################################################################
#Thumbprint vom neu erstellten self-signed Zertifikat hier einfügen
####---------->
$thumbprint = '‎D3FFC2255A62AE80732E18F8D6F559A601F41118'
####<----------
###################################################################

#Erstellen einer neuen Guid für die Notification ID
$registrationkey = [guid]::NewGuid()
# ======================================== Arguments ======================================== #
 
# =================================== Section DSC Client =================================== #
configuration CreateNewPullServer
 {
    param 
    (
        [string[]]$NodeName = 'localhost',
 
        [ValidateNotNullOrEmpty()]
        [string] $certificateThumbPrint,
 
        [Parameter(HelpMessage = 'This should be a string with enough entropy (randomness) to protect the registration of clients to the pull server.  We will use new GUID by default.')]
        [ValidateNotNullOrEmpty()]
        [string] $RegistrationKey # A guid that clients use to initiate conversation with pull server
    )
   
    Import-DSCResource -ModuleName xPSDesiredStateConfiguration
    Import-DSCResource –ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

    Node $NodeName
    {
 
        File DscFolder {
            Ensure = "Present"
            DestinationPath = "C:\Temp\DscService"
            Type = "Directory"
        }

        File WebserverFolder {
            Ensure = "Present"
            DestinationPath = "C:\Temp\inetpub"
            Type = "Directory"
        }

        WindowsFeature Webserver {
            Ensure = "Present"
            Name = "Web-Server"
        }

        WindowsFeature DSCServiceFeature {
            Ensure = "Present"
            Name = "DSC-Service"
            DependsOn = "[WindowsFeature]Webserver"         
        }

        WindowsFeature IISManagementTools {
            Ensure = "Present"
            Name = "Web-Mgmt-Tools"
            DependsOn = '[WindowsFeature]IIS'
        }
 
        xDscWebService PSDSCPullServer {
            Ensure = "Present"
            EndpointName = "PSDSCPullServer"
            Port = 7001
            PhysicalPath = "C:\Temp\wwwroot\PSDSCPullServer"
            CertificateThumbPrint = $certificateThumbPrint         
            ModulePath = "C:\Temp\DscService\Modules"
            #ModulePath                   = "\\NAS_Alias\Dsc_Pull_Server\Modules"
            ConfigurationPath = "C:\Temp\DSCService\mof_files" 
            #ConfigurationPath            = "\\NAS_Alias\Dsc_Pull_Server\Configuration"        
            State = "Started"
            DependsOn = "[WindowsFeature]DSCServiceFeature" 
            RegistrationKeyPath = "C:\Temp\DscService"   
            UseSecurityBestPractices = $false
            AcceptSelfSignedCertificates = $true
        }
 
        File RegistrationKeyFile {
            Ensure = 'Present'
            Type = 'File'
            DestinationPath = "C:\Temp\DscService\RegistrationKeys.txt"
            Contents = $RegistrationKey
        }
    }
}

#Falls das Modul fehlt, installieren
#Find-DscResource -ModuleName xPSDesiredStateConfiguration -Verbose | Install-Module -Force

# Neues self-signed Zertifikat erstellen
#New-SelfSignedCertificate -CertStoreLocation "cert:\LocalMachine\My" -Subject CN=Dsc_Test
#Den Thumbprint des neu erstellten Zertifikates in den oberen Teil im Scritp kopieren

#Erstellt das Mof File für die Configuration des DSC Webservers
CreateNewPullServer -OutputPath "C:\Temp\DscService\" -RegistrationKey $Registrationkey -certificateThumbPrint $thumbprint

#Start die Erstellung des PullServers
Start-DscConfiguration "C:\Temp\DscService" -Verbose -Wait -Force