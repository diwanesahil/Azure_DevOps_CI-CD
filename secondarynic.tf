resource "azurerm_network_interface" "secondarynic" {
  name                = "SecondaryNIC"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name

  ip_configuration {
    name                          = "SecondaryNICIPConfig"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"

      }
    ip_configuration {
    name                          = "SecondaryNICIPConfignew"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    
   
    }

  tags = {
    environment = "production"
  }
  
}