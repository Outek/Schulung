# Get Dsc Current state from remote nodes
#Get-DscConfiguration -CimSession <RemoteServer>

# Get Dsc Configuration status
Get-DscConfigurationStatus -CimSession localhost

# -All um die komplette Konfiguration anzuzeigen
Get-DscConfigurationStatus -CimSession localhost -All

# Test DesiredState des Servers
# True bedeutet, dass der Server der gewünschten Konfiguration entspricht
Test-DscConfiguration -ComputerName localhost

# Get detailed report
Test-DscConfiguration -ComputerName localhost -Detailed

# Delete the C:\Scripts folder on remote node and test again
#Remove-Item '\\S16-01\C$\Scripts' -Recurse -Force
#Test-DscConfiguration -ComputerName locahost -Detailed