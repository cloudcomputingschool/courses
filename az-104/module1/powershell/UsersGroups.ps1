<#
You can manage Microsoft 365 by using the Azure AD PowerShell for Graph (AzureAD) module or the Microsoft Azure Active Directory Module for Windows PowerShell (MSOnline) module.
The Azure AD PowerShell for Graph module is the newer module and is generally preferred over the Azure Active Directory Module for Windows PowerShell module. 
However, some functionality in the Azure Active Directory Module for Windows PowerShell module isn't replicated in the Azure AD PowerShell for Graph module. 
Depending on your task, you might need to install and use both modules.

The Azure AD PowerShell cmdlets does not work with the new PowerShell 7 as it is based on .net Core. 
Microsoft is in the process of getting updated. As of now we suggest to use the Windows PowerShell 5.x Module to be used for Azure AD powershell operations.

#>

#Azure AD PowerShell for Graph
Install-Module AzureAD
Connect-AzureAD

#Azure AD Module for Windows PowerShell
Install-Module MSOnline
Connect-MSOnline

#Microsoft Graph PowerShell SDK
Install-Module Microsoft.Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

#Azure Cloud Shell
<#
As an alternative to installing and maintaining the AzureAD and Azure Active Directory Module for Windows PowerShell modules in multiple locations, 
you can use Azure Cloud Shell. Cloud Shell is a prompt with PowerShell functionality that you can access through a web browser. 
The Microsoft 365 admin center provides a link to open Cloud Shell.
Many PowerShell modules that are used to manage Microsoft 365 services are automatically installed in the shell. 
You must have an Azure subscription to use Cloud Shell.
#>
