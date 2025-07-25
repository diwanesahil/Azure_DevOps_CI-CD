/*resource "azurerm_virtual_network" "ProductionVNet" {
  name                = "ProdVNet"
  resource_group_name = azurerm_resource_group.prodrg.name
  location            = azurerm_resource_group.prodrg.location
  address_space       = ["10.0.0.0/16"]
  
}

resource "azurerm_subnet" "ProductionSubnet" {
  name                 = "ProdSubnet"
  resource_group_name  = azurerm_resource_group.prodrg.name
  virtual_network_name = azurerm_virtual_network.ProductionVNet.name
  address_prefixes     = ["10.0.0.0/24"]
}*/