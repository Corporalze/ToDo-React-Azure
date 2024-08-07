param location string
param webAppSubnet string = 'webAppSubnet'

resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: 'VNetBicep'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/16'
      ]
    }
    subnets: [
      {
        name: webAppSubnet
        properties: {
          addressPrefix: '10.10.2.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Web'
              locations:[location]
            }
          ]
        }
        
      }
    ]
  }
}

output waSubnet string = webAppSubnet
output vnet string = vnet.name
output vnetId string = vnet.id

output waSubnetId string = vnet.properties.subnets[0].id
