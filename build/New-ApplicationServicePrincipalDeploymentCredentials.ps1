Set-StrictMode -Version latest

. .\Set-BuildContext.ps1

# az ad sp create-for-rbac --name $appName --role contributor --scopes /subscriptions/$subscriptionId/resourceGroups/$rgName --sdk-auth

$app = Get-AzADApplication -IdentifierUri 'https://twilightsoul.com/'
if ($null -eq $app)
{
    $app = New-AzADApplication -DisplayName 'WebSite' -IdentifierUris @("https://twilightsoul.com/", "https://codecharm.com/")
}


$sp = Get-AzADServicePrincipal -ApplicationId $app.ApplicationId
if ($null -eq $sp)
{
    $sp = New-AzADServicePrincipal -ApplicationId $app.ApplicationId -DisplayName 'WebSite' -Scope "/subscriptions/$subscriptionId/resourceGroups/$rgName" -Role Contributor
}

"Sp:"
$sp | ConvertTo-Json -Depth 5

$context = Get-AzContext
$account = $context.Account
$upn = $account.Id

# $owner = $sp.

# # Define the length of the password
# $length = 16

# # Define the characters that can be used in the password
# $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()'

# # Create a byte array for the RNGCryptoServiceProvider
# $bytes = [System.Byte[]]::new($length)

# # Create a new RNGCryptoServiceProvider
# $rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::new()

# # Fill the byte array with random bytes
# $rng.GetBytes($bytes)

# # Create a new password by selecting random characters from the character set
# $password = ""
# for ($i = 0; $i -lt $length; $i++) {
#     $password += $characters[$bytes[$i] % $characters.Length]
# }

# [securestring]$securePassword = ConvertTo-SecureString -String $password -AsPlainText

# "Cred:"
# $cred = New-AzADAppCredential -ObjectId $app.ObjectId -Password $securePassword -EndDate (Get-Date).AddMonths(6)
# $cred | ConvertTo-Json -Depth 5

"App:"
$app | ConvertTo-Json -Depth 5

$spcred = Get-AzADServicePrincipalCredential -ObjectId $sp.Id
if ($null -eq $spcred)
{
    $spcred = New-AzADServicePrincipalCredential -ObjectId $sp.Id -EndDate (Get-Date).AddMonths(6)
}

"SPCred:"
$spcred | ConvertTo-Json -Depth 5

$secureSecret = $spcred.Secret
$secret = ConvertFrom-SecureString -SecureString $secureSecret -AsPlainText

"Secret:"
$secret
