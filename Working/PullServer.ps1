# DSC configuration for Pull Server using registration

# The Sample_xDscWebServiceRegistration configuration sets up a DSC pull server that is capable for client nodes
# to register with it and retrieve configuration documents with configuration names instead of configuration id

# Prerequisite: Install a certificate in "CERT:\LocalMachine\MY\" store
#               For testing environments, you could use a self-signed certificate. (New-SelfSignedCertificate cmdlet could generate one for you).
#               For production environments, you will need a certificate signed by valid CA.
#               Registration only works over https protocols. So to use registration feature, a secure pull server setup with certificate is necessary


# The Sample_MetaConfigurationToRegisterWithLessSecurePullServer register a DSC client node with the pull server

# =================================== Section Pull Server =================================== #
configuration Sample_xDscWebServiceRegistration
{
    param 
    (
        [string[]]$NodeName = 'localhost',

        [ValidateNotNullOrEmpty()]
        [string] $certificateThumbPrint,

        [Parameter(HelpMessage='This should be a string with enough entropy (randomness) to protect the registration of clients to the pull server.  We will use new GUID by default.')]
        [ValidateNotNullOrEmpty()]
        [string] $RegistrationKey   # A guid that clients use to initiate conversation with pull server
    )

    Import-DSCResource -ModuleName xPSDesiredStateConfiguration

    Node $NodeName
    {
        WindowsFeature DSCServiceFeature
        {
            Ensure = "Present"
            Name   = "DSC-Service"            
        }

        xDscWebService PSDSCPullServer
        {
            Ensure                  = "Present"
            EndpointName            = "PSDSCPullServer"
            Port                    = 8080
            PhysicalPath            = "$env:SystemDrive\inetpub\PSDSCPullServer"
            CertificateThumbPrint   = $certificateThumbPrint
            ModulePath              = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Modules"
            ConfigurationPath       = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration"            
            State                   = "Started"
            DependsOn               = "[WindowsFeature]DSCServiceFeature" 
            RegistrationKeyPath     = "$env:PROGRAMFILES\WindowsPowerShell\DscService"   
            AcceptSelfSignedCertificates = $true
        }

        File RegistrationKeyFile
        {
            Ensure          = 'Present'
            Type            = 'File'
            DestinationPath = "$env:ProgramFiles\WindowsPowerShell\DscService\RegistrationKeys.txt"
            Contents        = $RegistrationKey
        }
    }
}

# Sample use (please change values of parameters according to your scenario):
$thumbprint = (New-SelfSignedCertificate -Subject "TestPullServer").Thumbprint
$registrationkey = [guid]::NewGuid()
Sample_xDscWebServiceRegistration -RegistrationKey $registrationkey -certificateThumbPrint $thumbprint

# =================================== Section Pull Server =================================== #

# Create a checksum for this. This is needed for the pull client to understand if there are subsequent changes to the configuration
New-DscChecksum -Path C:\DemoScripts\ArchiveDemoForPull\ArchiveDemo.mof -OutPath C:\DemoScripts\ArchiveDemoForPull

# update the LCM client so that it downloads the configuration and modules
Update-DscConfiguration -ComputerName S12R2-01 -Wait -Verbose


Start-DscConfiguration -Path C:\Demoscripts\CompositeDemo -Verbose -Wait -force