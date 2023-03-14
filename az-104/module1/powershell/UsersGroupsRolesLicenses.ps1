<#
Microsoft Learn and Docs References:
https://learn.microsoft.com/en-us/training/paths/manage-microsoft-365-services-use-windows-powershell/
https://github.com/Azure/azure-powershell
https://learn.microsoft.com/en-us/powershell/azure/?view=azps-9.5.0
https://learn.microsoft.com/en-us/powershell/module/?view=azps-9.5.0
#>

#region AzureAD connection and basics
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Update-Module -Name Az -Scope CurrentUser -Force
Install-Module -Name Az.Resources -Repository PSGallery -Scope CurrentUser

#Log into Azure
# Opens a new browser window to log into your Azure account.
Connect-AzAccount

# Log in with a previously created service principal. Use the application ID as the username, and the secret as password.
$Credential = Get-Credential
Connect-AzAccount -ServicePrincipal -Credential $Credential -TenantId $TenantId

# Alternatively, log into a specific cloud, for example the Azure China cloud.
Connect-AzAccount -Environment AzureChinaCloud

#A session context persists login information across Azure PowerShell modules and PowerShell instances. Use the Get-AzContext cmdlet to view the context you are using in the current session. The results contain the Azure tenant and subscription.
# Get the Azure PowerShell context for the current PowerShell session
Get-AzContext

# Lists all available Azure PowerShell contexts in the current PowerShell session
Get-AzContext -ListAvailable

# Get all of the Azure subscriptions in your current Azure tenant
Get-AzSubscription

# Get all of the Azure subscriptions in a specific Azure tenant
Get-AzSubscription -TenantId $TenantId

# Set the Azure PowerShell context to a specific Azure subscription
Set-AzContext -Subscription $SubscriptionName -Name 'MyContext'

# Set the Azure PowerShell context using piping
Get-AzSubscription -SubscriptionName $SubscriptionName | Set-AzContext -Name 'MyContext'

# List all cmdlets in the Az.Accounts module
Get-Command -Module Az.Accounts

# List all cmdlets that contain VirtualNetwork in their name
Get-Command -Name '*VirtualNetwork*'

# List all cmdlets that contain VM in their name in the Az.Compute module
Get-Command -Module Az.Compute -Name '*VM*'

# View basic help information for Get-AzSubscription
Get-Help -Name Get-AzSubscription

# View the examples for Get-AzSubscription
Get-Help -Name Get-AzSubscription -Examples

# View the full help for Get-AzSubscription
Get-Help -Name Get-AzSubscription -Full

# View the online version of the help from https://learn.microsoft.com for Get-AzSubscription
Get-Help -Name Get-AzSubscription -Online


#endregion

#region Azure AD Users Groups Licenses Roles and other Azure AD components
Get-AzADUser
#Lists entities from users or get entity from users by key
Get-AzADGroup
#Lists entities from groups or get entity from groups by key
Get-AzADApplication 
#Lists entities from applications or get entity from applications by key
Get-AzADGroupMember 
#Lists members from group.
Get-AzADOrganization 
#Retrieve a list of organization objects.
Get-AzADSpCredential
#Lists key credentials and password credentials for an service principal.
Get-AzADAppCredential
#Lists key credentials and password credentials for an application.
Get-AzADAppPermission 
#Lists API permissions the application has requested.
Get-AzADDomainService 
#The Get Domain Service operation retrieves a json representation of the Domain Service.
Get-AzADServicePrincipal 
#Lists entities from service principals or get entity from service principals by key
Get-AzAdvisorConfiguration
#Retrieve Azure Advisor configurations and also retrieve configurations of contained resource groups.
Get-AzAdvisorRecommendation
#Obtains details of a cached recommendation.
Get-AzADAppFederatedCredential 
#Get federatedIdentityCredentials by Id from applications.




#end region


#region Microsoft365
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

#Manage users with AzureAD cmdlets
$UserPassword=New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$UserPassword.Password="Pa55w.rd"
New-AzureADUser -DisplayName "Abbie Parsons" -GivenName "Abbie" -SurName "Parsons" -UserPrincipalName AbbieP@adatum.com -UsageLocation US -PasswordProfile $UserPassword -AccountEnabled $true
Get-AzureADUser -ObjectId AbbieP@adatum.com
Get-AzureADUser -All $true

#Manage users with Msol cmdlets
New-MsolUser -DisplayName "Abbie Parsons" -FirstName "Abbie" -LastName "Parsons" -UserPrincipalName AbbieP@adatum.com -Password "Pa55w.rd"
Get-MsolUser -UserPrincipalName AbbieP@adatum.com
Get-MsolUser -All

#Managing groups with AzureAD cmdlets
New-AzureADGroup -DisplayName "Marketing Group" -MailEnabled $true -SecurityEnabled $true -MailNickname MarketingGrp

#endregion

