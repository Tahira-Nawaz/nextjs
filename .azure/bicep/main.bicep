targetScope = 'subscription'
param resourcegroup string = 'tahira-1-rg'
param env string = 'info'
param tag string = 'createdbytahira'
param webAppName string = 'uniqueString(resourceGroup().id)'
param location string = 'eastus2'


resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourcegroup
  location: location
  tags: {
    Environment: env
    Department: tag
  }
}

module webapp 'webapp1.bicep' = {
  name: 'webapp_Deployment'
  scope: rg
  params: {
    location: location
    webAppName: webAppName
  }
}
