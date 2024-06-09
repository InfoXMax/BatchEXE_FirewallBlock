# Specify the folder containing the .exe files
$folderPath = "C:\Path\To\Your\Folder"

# Get all .exe files in the specified folder
$exeFiles = Get-ChildItem -Path $folderPath -Filter *.exe

foreach ($exeFile in $exeFiles) {
    # Create an outbound rule to block the .exe file
    New-NetFirewallRule -DisplayName "Block Outbound $($exeFile.Name)" `
                        -Direction Outbound `
                        -Action Block `
                        -Program $exeFile.FullName `
                        -Profile Any

    # Create an inbound rule to block the .exe file
    New-NetFirewallRule -DisplayName "Block Inbound $($exeFile.Name)" `
                        -Direction Inbound `
                        -Action Block `
                        -Program $exeFile.FullName `
                        -Profile Any
}

Write-Host "Firewall rules have been added for all .exe files in $folderPath."
