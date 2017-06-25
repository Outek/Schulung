# Exploring Language Extensions
Get-Module -ListAvailable -Name PSDesiredStateConfiguration

# Get all exported commands from PSDesiredStateConfiguration
Get-Command -Module PSDesiredStateConfiguration

# Keywords
Get-Command -Name Configuration | Select-Object CommandType, ModuleName, Parameters

# The ResourceModuleTuplesToImport is a parameter that gets added at runtime; Identifies the modules that are imported in a configuration
Get-Command -Name Configuration | Select-Object -ExpandProperty Parameters

# Laden der CIM Daten
[Microsoft.PowerShell.DesiredStateConfiguration.Internal.DscClassCache]::LoadDefaultCimKeywords()

# Betrachten der importierten Ressourcen und Module
[System.Management.Automation.Language.DynamicKeyword]::GetKeyword() | Select-Object Keyword, ImplementingModule

# Cmdlets für die Verwendung von Dsc Befehlen
Get-Command -Module PSDesiredStateConfiguration -Noun DSCConfiguration*

# Liste mit allen Dsc Modulen
Get-DscResource