
$appPermissionsOutputFile = ".\Graph_ApplicationPermissions.csv"
$delegatedPermissionsOutputFile = ".\Graph_DelegatedPermissions.csv"

$clientId = "<client_id>"
$tenantId = "<tenant_id>"
$secret = "<secret_value>"

$securedSecret = ConvertTo-SecureString `
-String $secret -AsPlainText -Force

$clientSecretCredential = New-Object `
-TypeName System.Management.Automation.PSCredential `
-ArgumentList $clientId, $securedSecret

Connect-MgGraph -TenantId $tenantId -ClientSecretCredential $clientSecretCredential

Import-Module Microsoft.Graph.Applications

# get Microsoft Graph app by appId
$data = Get-MgServicePrincipal -Filter "appId eq '00000003-0000-0000-c000-000000000000'" -Property "displayName,appRoles,oauth2PermissionScopes"

# get by name
$data = Get-MgServicePrincipal -Filter "displayName eq 'Microsoft Graph'" -Property "displayName,appRoles,oauth2PermissionScopes"

# filter app roles associated with application
$data.AppRoles | `
Where-Object { $_.AllowedMemberTypes -contains 'Application' } | `
Select-Object Value, Id, DisplayName, Description, Origin, IsEnabled | `
Export-Csv -Path $appPermissionsOutputFile -NoTypeInformation

$data.Oauth2PermissionScopes | `
Select-Object Value, Id, UserConsentDisplayName, UserConsentDescription, AdminConsentDescription, AdminConsentDisplayName, Type, IsEnabled | `
Export-Csv -Path $delegatedPermissionsOutputFile -NoTypeInformation
