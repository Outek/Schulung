# Exploring Language Extensions
Get-Module -ListAvailable -Name PSDesiredStateConfiguration

# Get all exported commands from PSDesiredStateConfiguration
Get-Command -Module PSDesiredStateConfiguration

# Laden der CIM Daten
[Microsoft.PowerShell.DesiredStateConfiguration.Internal.DscClassCache]::LoadDefaultCimKeywords()

# Betrachten der importierten Ressourcen und Module
[System.Management.Automation.Language.DynamicKeyword]::GetKeyword() | Select-Object Keyword, ImplementingModule

# Liste mit allen Dsc Modulen
Get-DscResource