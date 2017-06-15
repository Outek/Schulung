Configuration TestFolder {
    param ()
    Node Localhost 
    {
        # Create a Test File
        File CreateTestFolder
        {
            Ensure          = "Present"
            DestinationPath = "C:\DscDemo"
            Type            = "Directory"
        }
    }
}
 
# Create MOF Files
TestFolder -OutputPath C:\DscDemo
 
# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait