Set-StrictMode -Version latest

. .\Set-BuildContext.ps1

Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Az.KeyVault

$vault = Get-SecretVault -Name $psSecretManagementVaultName -ErrorAction SilentlyContinue
if ($null -eq $vault) {
    $vaultParameters = @{
        AZKVaultName   = $azKeyVaultName
        SubscriptionId = $subscriptionId
    }

    $vault = Register-SecretVault -ModuleName Az.KeyVault -Name $psSecretManagementVaultName -VaultParameters $vaultParameters
}
else {
    Write-Information 'Secret vault already exists'
}
