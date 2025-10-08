
resource "azurerm_public_ip" "windowsvmpip" {
  name                = "WindowsVMPIP"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  allocation_method   = "Static"
  
}