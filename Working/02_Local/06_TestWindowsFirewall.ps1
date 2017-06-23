Configuration TestFirewall {
    param ()

    Import-DscResource -ModuleName "xNetworking"

    Node Localhost 
    {
        # Create a Test File
        xFirewall _FTP_any_tcp_21 {
            Name        = "_FTP_any_tcp_21"
            Ensure      = "Present"
            Direction   = "Outbound"
            Description = "Rule für ausgehende FTP Verbindungen"
            Profile     = "Domain,Private,Public"
            RemotePort  = "21" 
            Action      = "Block"
            Enabled     = "True"
            Protocol    = "TCP" 
        }
    }
}

# Suchen des Firewall Modules
#Find-DscResource -ModuleName *Firewall*

#Find-DscResource -ModuleName xNetworking

# Install DSC resource modules from PowerShell Gallery
#Find-DscResource -ModuleName xNetworking | Install-Module -Force
 
# Create MOF Files
TestFirewall -OutputPath C:\DscDemo
 
# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait