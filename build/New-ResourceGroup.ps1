Set-StrictMode -Version latest

. .\Set-BuildContext.ps1

$rg = Get-AzResourceGroup -Name $rgName -ErrorAction SilentlyContinue
if ($null -eq $rg)
{
    New-AzResourceGroup -Name $rgName -Location $webSiteLocation
}
else {
    Write-Information "Resource group '$rgName' already exists"
}
