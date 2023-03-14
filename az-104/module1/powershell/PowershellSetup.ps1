<#
Microsoft Learn and Docs References:
https://learn.microsoft.com/en-us/training/paths/manage-microsoft-365-services-use-windows-powershell/
https://github.com/Azure/azure-powershell
https://learn.microsoft.com/en-us/powershell/azure/?view=azps-9.5.0
https://learn.microsoft.com/en-us/powershell/module/?view=azps-9.5.0
#>

#First install winget package manager as per https://learn.microsoft.com/en-us/windows/package-manager/winget/

#Then install latest Powershell core via winget
winget install --id=Microsoft.PowerShell -e


#region AzureAD connection and basics with Azure Az module
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Update-Module -Name Az -Scope CurrentUser -Force
Install-Module -Name Az.Resources -Repository PSGallery -Scope CurrentUser
