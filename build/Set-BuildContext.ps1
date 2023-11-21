$context = Select-AzContext -Name 'VS Enterprise NN'
$subscriptionId = $context.Subscription.Id
$tenantId = $context.Tenant.Id

if ($tenantId -ne '3f21bc34-fb7b-49dc-b4b5-3c434324ac17')
{
    throw 'Invalid tenant'
}

if ($subscriptionId -ne '90619429-3c83-445e-91df-13e95e0d98a1')
{
    throw 'Invalid subscription'
}

$webSiteLocation = 'South Central US'

$rgName = 'rg-tsw-prd-scu'

$appName = 'app-tsw-prd-scu'

$azKeyVaultName = 'kv-tsw-prd-scu'

$psSecretManagementVaultName = 'az-kv-tsw-prd-scu'
