param(
    [string[]]$Tasks
)

foreach ($Task in $Tasks)
{
    switch ($Task)
    {
        "analyze"
        {
            Write-Output "start analyze"
            #Code wird analysiert mit PSScriptAnalyzer
            #Code wird grob auf Schreibfehler und ähnliches geprüft
            #Code oder Codeteile werden auf Best Practices geprüft 
        }
        "test"
        {
            Write-Output "start test"
            #Code wird getestet mit Pester-Test
            #Installation von Software wird geprüft
            #Konfiguration wird auf Korrektheit geprüft
        }
        "build"
        {
            Write-Output "start build"
            #Erstellen der *.mof Files für Dsc Ressource
            #oder Paket erstellen für Chocolatey
            #oder 
        }
        "release"
        {
            Write-Output "start release"
            #Kopieren von Files auf einen NAS Share 
            #oder Software Paket pushen auf einen Webserver           
        }
    }
}