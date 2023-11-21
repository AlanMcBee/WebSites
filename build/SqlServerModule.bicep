param ResourceGroupLocation string = 'South Central US'

@secure()
param SqlServerAdministratorLoginPassword string

resource SqlServerResource 'Microsoft.Sql/servers@2023-02-01-preview' = {
    name: 'sql-tsw-prd-scu'
    location: ResourceGroupLocation
    properties: {
        version: '12.0'
        minimalTlsVersion: '1.2'
        publicNetworkAccess: 'Enabled'
        administratorLogin: 'tswAdmin'
        administratorLoginPassword: SqlServerAdministratorLoginPassword
        administrators: {
            administratorType: 'activeDirectory'
            azureADOnlyAuthentication: false
            login: 'alanmcbee_outlook.com#EXT#@NybbleNudgeroutlook.onmicrosoft.com'
            principalType: 'User'
            sid: subscription().subscriptionId
            tenantId: subscription().tenantId
        }
        primaryUserAssignedIdentityId: ''
    }
    identity: {
        type: 'None'
    }

    resource SqlServerDatabaseResource 'databases' = {
        location: ResourceGroupLocation
        name: 'sqldb-tsw-prd-scu'
        properties: {
          collation: 'SQL_Latin1_General_CP1_CI_AS'
          maxSizeBytes: 5368709120
          zoneRedundant: false
          licenseType: ''
          minCapacity: 1
          autoPauseDelay: 360
          requestedBackupStorageRedundancy: 'Local'
          useFreeLimit: false
        }
        sku: {
          name: 'GP_S_Gen5_2'
          tier: 'GeneralPurpose'
        }
      }
      
}
