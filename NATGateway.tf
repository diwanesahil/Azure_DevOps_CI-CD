

/*resource "azurerm_public_ip" "natpip" {
  name                = "NatPublicIP"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  allocation_method   = "Static"
  sku = "Standard"
  
}

resource "azurerm_nat_gateway" "vmnatgw" {
  name                = "WindowsVMNatGateway"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  sku_name = "Standard"
   
}

resource "azurerm_nat_gateway_public_ip_association" "natgtwpipassocuation" {
  nat_gateway_id = azurerm_nat_gateway.vmnatgw.id
  public_ip_address_id   = azurerm_public_ip.natpip.id
  
}*/