Set-StrictMode -Version latest

. .\Set-BuildContext.ps1

Import-Module Microsoft.PowerShell.SecretManagement
Import-Module Az.KeyVault

$vault = Get-SecretVault -Name $psSecretManagementVaultName -ErrorAction SilentlyContinue
if ($null -eq $vault) {
    .\Register-SecretManagementAzKeyVault.ps1
}

$secretInfo = Get-SecretInfo -Vault $psSecretManagementVaultName -Name 'kvss-tsw-prd-scu' -ErrorAction SilentlyContinue
if ($null -eq $secretInfo) {
    # Define the length of the password
    $length = 16

    # Define the characters that can be used in the password
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()'

    # Create a byte array for the RNGCryptoServiceProvider
    $bytes = [System.Byte[]]::new($length)

    # Create a new RNGCryptoServiceProvider
    $rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::new()

    # Fill the byte array with random bytes
    $rng.GetBytes($bytes)

    # Create a new password by selecting random characters from the character set
    [System.Text.StringBuilder] $passwordBuilder = [System.Text.StringBuilder]::new($length)
    for ($i = 0; $i -lt $length; $i++) {
        $character = $characters[$bytes[$i] % $characters.Length]
        $null = $passwordBuilder.Append($character)
    }
    $password = $passwordBuilder.ToString()

    # Convert the password to a secure string
    [securestring]$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

    # Store the password in the key vault
    Set-Secret -Vault $psSecretManagementVaultName -Name 'kvss-tsw-prd-scu' -SecureStringSecret $securePassword

    $password
}
else {
    Write-Information 'Secret already exists'
}