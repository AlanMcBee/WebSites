@description('Describes the database Edition, Tier, Dtu, Gigabytes (Edition-Tier-Dtu-Gigabytes)')
@allowed([
  'Basic-Basic-5-2'
  'Standard-S0-10-250'
  'Standard-S1-20-250'
  'Standard-S2-50-250'
  'Standard-S3-100-250'
  'Standard-S4-200-250'
  'Standard-S6-400-250'
  'Standard-S7-800-250'
  'Standard-S9-1600-250'
  'Standard-S12-3000-250'
  'Premium-P1-125-500'
  'Premium-P2-250-500'
  'Premium-P4-500-500'
  'Premium-P6-1000-500'
  'Premium-P11-1750-500-1024'
  'Premium-P15-4000-1024'
  'GeneralPurpose-GP_Gen5_2-2-250'
  'GeneralPurpose-GP_S_Gen5_2-2-250'
])
param sqlDatabaseEditionTierDtuCapacity string = 'Basic-Basic-5-2'

@description('The name of the sql server. It has to be unique.')
param sqlServerName string

@description('The name of the sql databaseName. It has to be unique.')
param sqlDatabaseName string

@description('The admin user of the SQL Server')
param sqlAdministratorLogin string

@description('The password of the admin user of the SQL Server')
@secure()
param sqlAdministratorLoginPassword string

@description('The name of the website. It has to be unique.')
param BlazorWebsiteName string

@allowed([
  'F1'
  'D1'
  'B1'
  'B2'
  'B3'
  'S1'
  'S2'
  'S3'
  'P1'
  'P2'
  'P3'
  'P4'
])
param BlazorSKU string = 'B1'

@description('Describes plan\'s instance count')
@minValue(1)
@maxValue(3)
param BlazorSKUCapacity int = 1

@description('Location for all resources.')
param location string = resourceGroup().location

var hostingPlanName = 'Oqtane-hostingplan-${uniqueString(resourceGroup().id)}'
var databaseCollation = 'SQL_Latin1_General_CP1_CI_AS'
var databaseEditionTierDtuCapacity = split(sqlDatabaseEditionTierDtuCapacity, '-')
var databaseEdition = databaseEditionTierDtuCapacity[0]
var databaseTier = databaseEditionTierDtuCapacity[1]
var databaseDtu = ((length(databaseEditionTierDtuCapacity) > 2) ? databaseEditionTierDtuCapacity[2] : '')
var databaseMaxSizeGigaBytes = ((length(databaseEditionTierDtuCapacity) > 3) ? databaseEditionTierDtuCapacity[3] : '')
var databaseServerlessTiers = [
  'GP_S_Gen5_2'
]

resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: sqlServerName
  location: location
  tags: {
    displayName: 'SQL Server'
  }
  properties: {
    administratorLogin: sqlAdministratorLogin
    administratorLoginPassword: sqlAdministratorLoginPassword
    version: '12.0'
  }
}

resource sqlServerName_sqlDatabase 'Microsoft.Sql/servers/databases@2021-11-01' = {
  parent: sqlServer
  name: '${sqlDatabaseName}'
  location: location
  tags: {
    displayName: 'Database'
  }
  sku: {
    name: ((databaseEdition == 'GeneralPurpose') ? databaseTier : databaseEdition)
    tier: databaseEdition
    capacity: ((databaseDtu == '') ? json('null') : int(databaseDtu))
  }
  kind: 'v12.0,user,vcore${(contains(databaseServerlessTiers, databaseTier) ? ',serverless' : '')}'
  properties: {
    edition: databaseEdition
    collation: databaseCollation
    maxSizeBytes: ((databaseMaxSizeGigaBytes == '') ? json('null') : (((int(databaseMaxSizeGigaBytes) * 1024) * 1024) * 1024))
    requestedServiceObjectiveName: databaseTier
  }
}

resource sqlServerName_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2021-11-01' = {
  parent: sqlServer
  name: 'AllowAllWindowsAzureIps'
  properties: {
    endIpAddress: '0.0.0.0'
    startIpAddress: '0.0.0.0'
  }
}

resource hostingPlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: hostingPlanName
  location: resourceGroup().location
  tags: {
    displayName: 'Blazor'
  }
  sku: {
    name: BlazorSKU
    capacity: BlazorSKUCapacity
  }
  properties: {
    name: hostingPlanName
    numberOfWorkers: 1
  }
  dependsOn: []
}

resource BlazorWebsite 'Microsoft.Web/sites@2018-02-01' = {
  name: BlazorWebsiteName
  location: location
  tags: {
    'hidden-related:${hostingPlan.id}': 'empty'
    displayName: 'Website'
  }
  properties: {
    name: BlazorWebsiteName
    serverFarmId: hostingPlan.id
    siteConfig: {
      webSocketsEnabled: true
      netFrameworkVersion: 'v5.0'
    }
  }
}

resource BlazorWebsiteName_web 'Microsoft.Web/sites/sourcecontrols@2018-02-01' = {
  parent: BlazorWebsite
  name: 'web'
  location: location
  properties: {
    repoUrl: 'https://github.com/oqtane/oqtane.framework.git'
    branch: 'master'
    isManualIntegration: true
  }
}