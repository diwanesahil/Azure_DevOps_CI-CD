
resource "azurerm_network_security_group" "WindowsVMNSG" {
  name                = "WindowsVMNSG"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["3389"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
}

resource "azurerm_subnet_network_security_group_association" "WindowsVMSubnetNSG" {
  subnet_id                 = azurerm_subnet.ProductionSubnet.id
  network_security_group_id = azurerm_network_security_group.WindowsVMNSG.id
    depends_on = [
        azurerm_network_interface.windowsVMNIC,
        azurerm_subnet.ProductionSubnet
            ]
}