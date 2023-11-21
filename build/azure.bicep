param ResourceGroupLocation string = 'South Central US'

resource KeyVaultResource 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
    name: 'kv-tsw-prd-scu'
}

resource WebServerResource 'Microsoft.Web/serverfarms@2022-09-01' = {
    name: 'plan-tsw-prd-scu'
    location: ResourceGroupLocation
    kind: 'linux'
    sku: {
        name: 'B1'
    }
}

resource WebSiteResource 'Microsoft.Web/sites@2022-09-01' = {
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
    }
}
