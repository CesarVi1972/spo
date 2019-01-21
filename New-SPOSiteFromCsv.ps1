<#
.SYNOPSIS
  Script to create multiple site collections in SharePoint online from a CSV file.
  
.DESCRIPTION
  Script to create multiple site collections in SharePoint online from a CSV file.
  
.PARAMETER
    None.
	
.INPUTS
  $spoadmin will ask for SharePoint Online Admin Center URL
  $inputfile will ask for CSV file with four columns: url,template,owner,quota as shown below.
  
  url,template,owner,quota
  https://microsoft365demo.sharepoint.com/sites/site12,STS#0,pablo@microsoft365demo.onmicrosoft.com,1024
  https://microsoft365demo.sharepoint.com/sites/site14,STS#0,pablo@microsoft365demo.onmicrosoft.com,1024
  
.OUTPUTS
  None.
  
.NOTES
  Version:        1.0
  Author:         Pablo Alejandro Fain <pablo@pablofain.com>
  Creation Date:  01/21/2019
  Purpose/Change: Initial script development
  
.EXAMPLE
  .\New-SPOSiteFromCsv.ps1
#>

$spoadmin = Read-Host -Prompt 'Enter your SharePoint Online Admin Center URL'
$inputfile = Read-Host -Prompt 'Enter the full path to your csv file'

#Importing csv file
$sites = Import-Csv $inputfile

#Connecting to SharePoint Online tenant
Connect-SPOService -Url $spoadmin

#Starting site collection creation process
Foreach ($site in $sites){
New-SPOSite -Url $site.url -Template $site.template -Owner $site.owner -StorageQuota $site.quota}