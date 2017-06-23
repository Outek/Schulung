Configuration TestFile {
    param ()
    Node Localhost 
    {
        # Create a Test File
        File CreateTestFile
        {
            Ensure          = "Present"
            DestinationPath = "C:\DscDemo\example.txt"
            Contents        = "Hallo PostFinance"
            Type            = "File"
        }
    }
}

# Create MOF Files
TestFile -OutputPath C:\DscDemo

# Start DSC Configuration
Start-DscConfiguration -Path C:\DscDemo -Verbose -Wait