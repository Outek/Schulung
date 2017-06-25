[DSCLocalConfigurationManager()]
configuration Demo_PullServer
{
    param
    (
        [ValidateNotNullOrEmpty()]
        [string] $NodeName = 'localhost',

        [ValidateNotNullOrEmpty()]
        [string] $RegistrationKey,

        [ValidateNotNullOrEmpty()]
        [string] $ServerName = 'localhost'
    )

    Node $NodeName
    {
        Settings
        {
            RefreshMode                    = 'Pull'
            RefreshFrequencyMins           = 30
            ConfigurationModeFrequencyMins = 15;  
            RebootNodeIfNeeded             = $true
            ConfigurationMode              = 'ApplyAndAutoCorrect';
        }

        ConfigurationRepositoryWeb CONTOSO-PullSrv
        {
            ServerURL          = "https://$ServerName`:7001/PSDSCPullServer.svc" # https
            RegistrationKey    = $RegistrationKey
            ConfigurationNames = @('ServerConfig')
        }   
    }
}

#Einfügen der Configuration ID aus dem erstellen file
$registrationkey = "ba92fec1-6a6e-4be3-9e50-560c1575785f"

# Sample use (please change values of parameters according to your scenario):
Demo_PullServer -RegistrationKey $registrationkey -OutputPath C:\Temp

# update the LCM client so that it downloads the configuration and modules
Update-DscConfiguration -ComputerName localhost -Wait -Verbose

# Run Configuration
Start-DSCConfiguration -Path C:\Temp -Wait -Verbose -Force