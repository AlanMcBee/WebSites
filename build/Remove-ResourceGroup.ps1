Set-StrictMode -Version latest

. .\Set-BuildContext.ps1

Remove-AzResourceGroup -Name $rgName
