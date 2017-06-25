Configuration TestWindowsFeature {
    param ()
    Node Localhost 
    {
        # Create a Test File
        WindowsFeature DSCServiceFeature
        {
            Ensure          = "Absent"
            Name            = "FS-SMB1"
        }
    }
}

# Create MOF Files
TestWindowsFeature -OutputPath C:\DscDemo

# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait

#Prüfen, ob das feature noch vorhanden ist
Get-WindowsFeature -Name "FS-SMB1"