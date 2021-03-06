Configuration TestRegistry {
    param ()
    Node Localhost 
    {
        # Create a Test File
        Registry DSCRegistry {
            Ensure    = "Present"
            ValueName = "Nas_Alias"
            ValueData = "Linuxstinkt_NAS"
            Key       = "HKEY_LOCAL_Machine\System\CurrentControlSet\Control\Session Manager\Environment"
        }
    }
}

# Create MOF Files
TestRegistry -OutputPath C:\DscDemo

# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait -Force

#Prüfen, ob der Key und value erstellt wurde
Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Environment" -Name "Nas_Alias"