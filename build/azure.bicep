param ResourceGroupLocation string
param ClientIP4Address string

resource KeyVaultResource 'Microsoft.KeyVault/vaults@2024-04-01-preview' existing = {
    name: 'kv-tsw-prd-scu'
}

resource StorageResource 'Microsoft.Storage/storageAccounts@2023-05-01' = {
    name: 'sttswprdscu'
    location: ResourceGroupLocation
    kind: 'StorageV2'
    sku: {
        name: 'Standard_LRS'
    }
}

resource WebServerResource 'Microsoft.Web/serverfarms@2023-12-01' = {
    name: 'plan-tsw-prd-scu'
    location: ResourceGroupLocation
    kind: 'linux'
    sku: {
        name: 'B1'
    }
}

resource WebSiteResource 'Microsoft.Web/sites@2023-12-01' = {
    name: 'app-tsw-prd-scu'
    location: ResourceGroupLocation
    identity: {
        type: 'SystemAssigned'
    }
    properties: {
        serverFarmId: WebServerResource.id
        httpsOnly: true
        publicNetworkAccess: 'Enabled'
        clientAffinityEnabled: false
        keyVaultReferenceIdentity: 'SystemAssigned'
    }
    dependsOn: [
        SqlServerResourceModule
        StorageResource
    ]

    resource WebSiteConfigResource 'config' = {
        name: 'web'
        properties: {
            alwaysOn: false
            netFrameworkVersion: 'v5.0'
            remoteDebuggingEnabled: true
            remoteDebuggingVersion: 'VS2022'
            use32BitWorkerProcess: false
            webSocketsEnabled: true
        }
    }
}

module SqlServerResourceModule 'SqlServerModule.bicep' = {
    name: 'SqlServerResourceModule'
    params: {
        ResourceGroupLocation: ResourceGroupLocation
        SqlServerAdministratorLoginPassword: KeyVaultResource.getSecret('kvss-tsw-prd-scu')
        NetworkFirewallClientIP4Address: ClientIP4Address
    }
}
