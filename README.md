# graph-api-permissions-reader
PowerShell script to read delegated and application permissions from Graph API

## Setup
- create a new app in Azure AD

![](https://machacekblogstorage.blob.core.windows.net/blogassets/06072023/AppOverview.png)
- add `Application.Read.All` application permission

![](https://machacekblogstorage.blob.core.windows.net/blogassets/06072023/ApiPermissions.png)
- create a new secret

![](https://machacekblogstorage.blob.core.windows.net/blogassets/06072023/AppSecret.png)
- run the script `ReadPermissions.ps1`
