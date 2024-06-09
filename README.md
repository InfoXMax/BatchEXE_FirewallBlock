

# Block EXE Files in Windows Firewall

This PowerShell script adds firewall rules to block all `.exe` files in a specified folder from accessing the internet. It creates both inbound and outbound rules for each executable file, effectively preventing them from making or receiving network connections.

## Usage Instructions

1. **Specify the Folder Path**:
   Edit the script to specify the folder containing the `.exe` files you want to block. Change the value of `$folderPath` to the path of your target folder.

   ```powershell
   $folderPath = "C:\Path\To\Your\Folder"
   ```

2. **Save the Script**:
   Save the script as `BlockExeFiles.ps1`.

3. **Set Execution Policy**:
   Open PowerShell as an administrator and set the execution policy to allow the script to run. This change is temporary and will revert when you close PowerShell.

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
   ```

4. **Run the Script**:
   Navigate to the directory where the script is saved and execute it.

   ```powershell
   cd C:\Path\To\Script
   .\BlockExeFiles.ps1
   ```

## How It Works

The script performs the following actions:

1. It retrieves all `.exe` files from the specified folder.
2. For each `.exe` file, it creates two firewall rules:
   - An outbound rule to block the executable from making outbound connections.
   - An inbound rule to block the executable from accepting inbound connections.
3. The rules are created with the profile set to `Any`, meaning they apply to all network profiles (Domain, Private, Public).

## Notes

- Ensure that you have administrative privileges when running the script, as adding firewall rules requires elevated permissions.
- The script changes the execution policy only for the current session. You can set it back to the default (Restricted) if needed.
- Test the script in a controlled environment before deploying it widely to avoid unintentional blocking of critical applications.

## License

This script is provided as-is, without any warranty or guarantee. Use it at your own risk.
