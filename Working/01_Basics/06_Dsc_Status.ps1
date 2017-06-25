# Get Dsc Current state from remote nodes
Get-DscConfiguration -CimSession localhost

# Get Dsc Configuration status
Get-DscConfigurationStatus -CimSession localhost

# Use -All switch to see all configuration enacts happend on the remote node
Get-DscConfigurationStatus -CimSession localhost -All

# Test DesiredState on the remote nodes
# True means that the system is in desired state
Test-DscConfiguration -ComputerName localhost

# Get detailed report
Test-DscConfiguration -ComputerName localhost -Detailed

# Induce failure
# Delete the C:\Scripts folder on remote node and test again
Remove-Item '\\S16-01\C$\Scripts' -Recurse -Force
Test-DscConfiguration -ComputerName locahost -Detailed

# test the desired state of a system against a reference configuration
Test-DscConfiguration -ComputerName localhost -ReferenceConfiguration C:\DemoScripts\Archivedemo\S16-01.mof -Verbose

