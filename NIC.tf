
resource "azurerm_network_interface" "windowsVMNIC" {
  name                = "WindowsVMNIC"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windowsvmpip.id
  }
  
}