Configuration MyWebApp
{
    Import-DscResource -Module PSDesiredStateConfiguration
    Import-DscResource -Module xSqlPs
    Import-DscResource -Module xWebAdministration

    Node $AllNodes.Where{$_.Role -contains "MSSQL"}.Nodename
    {
        # Install prerequisites
        WindowsFeature installdotNet35
        {            
            Ensure = "Present"
            Name   = "Net-Framework-Core"
            Source = "c:\software\sxs"
        }

        # Install SQL Server
        xSqlServerInstall InstallSqlServer
        {
            InstanceName = $Node.SQLServerName
            SourcePath   = $Node.SqlSource
            Features     = "SQLEngine,SSMS"
            DependsOn    = "[WindowsFeature]installdotNet35"
        }
    }

    Node $AllNodes.Where{$_.Role -contains "Web"}.NodeName
    {
        # Install the IIS role
        WindowsFeature IIS
        {
            Ensure = 'Present'
            Name   = 'Web-Server'
        }

        # Install the ASP .NET 4.5 role
        WindowsFeature AspNet45
        {
            Ensure = 'Present'
            Name   = 'Web-Asp-Net45'
        }

        # Stop the default website
        xWebsite DefaultSite 
        {
            Ensure       = 'Present'
            Name         = 'Default Web Site'
            State        = 'Stopped'
            PhysicalPath = 'C:\inetpub\wwwroot'
            DependsOn    = '[WindowsFeature]IIS'
        }

        # Copy the website content
        File WebContent
        {
            Ensure          = 'Present'
            SourcePath      = $Node.SiteContents
            DestinationPath = $Node.SitePath
            Recurse         = $true
            Type            = 'Directory'
            DependsOn       = '[WindowsFeature]AspNet45'
        }       

        # Create the new Website
        xWebsite NewWebsite
        {
            Ensure       = 'Present'
            Name         = $WebSiteName
            State        = 'Started'
            PhysicalPath = $Node.SitePath
            DependsOn    = '[File]WebContent'
        }
    }
}

# Find-DscResource -ModuleName xSqlPs | Install-Module -Force
# Find-DscResource -ModuleName xWebAdministration | Install-Module -Force

MyWebApp -ConfigurationData .\08_Separating_Config_Env.psd1 -OutputPath C:\DscDemo