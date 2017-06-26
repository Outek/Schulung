Configuration ArchiveDemo {
    Node localhost {
        Archive ArchiveScripts {
            Path        = "C:\demoscripts\Scripts.zip"
            Destination = "C:\Scripts"
            Ensure      = "Present"
        }
    }
}