Connect-MsolService 
$ReportPath = "c:\temp\scripts\userlist.csv"

$AllUsers = Get-MsolUser -All 
foreach ($User in $AllUsers)
{
$UserPrincipalName = $User.UserPrincipalName
$IsLicensed = $User.IsLicensed
$Licenses = $User.Licenses.AccountSkuId

Add-Content -value ($UserPrincipalName+","+$IsLicensed+","+$Licenses) -Path $ReportPath
}