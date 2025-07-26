resource "azurerm_network_interface" "secondarynic" {
  name                = "SecondaryNIC"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  
   

  ip_configuration {
    name                          = "ipconfug1"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = true
    

      }
    ip_configuration {
    name                          = "ipconfig2"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    
      
    }

    ip_configuration {
    name                          = "ipconfig3"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    
      
    }   
    ip_configuration {
    name                          = "ipconfig4"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
   
      
    }
    ip_configuration {
    name                          = "ipconfig5"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    
      
    }  

  tags = {
    environment = "production"
  }
  
  
}