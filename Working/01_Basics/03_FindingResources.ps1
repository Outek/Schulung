# Liste mit DSC Ressurcen welche verfügbar sind
Get-DscResource

# Liste mit DSC Ressurcen welche verfügbar sind von einem spezifischen Modul
Get-DscResource -Module PSDesiredStateConfiguration

# Liste von DSC Ressourcen online; das Packagemanagement Module wird benötigt
Find-DscResource

# Liste von DSC Ressourcen in einem spezifischen Module
Find-DscResource -ModuleName cHyper-V
Find-DscResource -ModuleName xSQLServer

# Install DSC resource modules from PowerShell Gallery
Find-DscResource -ModuleName xNetworking | Install-Module -Force