Configuration TestWindowsFeature {
    param ()
    Node Localhost 
    {
        # Create a Test File
        WindowsFeature DSCServiceFeature
        {
            Ensure          = "Present"
            Name            = "Web-Server"
        }
    }
}

# Create MOF Files
TestWindowsFeature -OutputPath C:\DscDemo

# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait