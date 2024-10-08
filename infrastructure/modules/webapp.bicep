//param vnetId string
//param subnetId string
param location string

var webAppName = 'reactApp'
var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  
  sku: {
    name: 'P1v3'
    tier: 'PremiumV3'
    size: 'P1v3'
  }
}

resource webApp 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
      alwaysOn:true
    }
    httpsOnly: true
    clientAffinityEnabled: false
    
  }
}


/*resource subnet 'Microsoft.Web/sites/virtualNetworkConnections@2023-12-01' = {
  name:'vnetIntegration'
  parent:webApp
  properties:{
    vnetResourceId:vnetId

  }
}

resource networkConfig 'Microsoft.Web/sites/networkConfig@2023-12-01' = {
  name: 'virtualNetwork'
  parent:webApp
  properties:{
    subnetResourceId:subnetId
  }
}
*/
