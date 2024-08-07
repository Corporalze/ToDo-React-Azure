param location string

module vnetModule './modules/vnet.bicep' = {
  name: 'deployVNet'
  params:{
    location: location
  }
}

module webApp 'modules/webapp.bicep' = {
  name:'deployWebApp'
  params:{
    //vnetId:vnetModule.outputs.vnetId
    //subnetId:vnetModule.outputs.waSubnet
    location:location
  }
  dependsOn:[
    vnetModule
  ]
}
