param location string

module vnetModule './Modules/vnet.bicep' = {
  name: 'deployVNet'
  params:{
    location: location
  }
}

module webApp 'Modules/webapp.bicep' = {
  name:'deployWebApp'
  params:{
    vnetId:vnetModule.outputs.vnetId
    subnetId:vnetModule.outputs.waSubnet
    location:location
  }
  dependsOn:[
    vnetModule
  ]
}
