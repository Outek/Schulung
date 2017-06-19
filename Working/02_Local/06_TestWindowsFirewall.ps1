Configuration TestFirewall {
    param ()
    Node Localhost 
    {
        # Create a Test File
        xFirewall TestRule {
            Ensure    = "Absent"
            ValueName = "Nas_Alias"
            ValueData = "pfnas"
            Key       = "HKEY_LOCAL_Machine\System\CurrentControlSet\Control\Session Manager\Environment"
        }
    }
}

# Find DSC resources in a specific module
Find-DscResource -ModuleName *Firewall*

# Install DSC resource modules from PowerShell Gallery
Find-DscResource -ModuleName xFirewall | Install-Module -Force
 
# Create MOF Files
TestFirewall -OutputPath C:\DscDemo
 
# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait