resource "azurerm_network_interface" "secondarynic" {
  name                = "SecondaryNIC"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  depends_on = [ azurerm_public_ip.ipconfig1-pip, azurerm_public_ip.ipconfig2-pip, azurerm_public_ip.ipconfig3-pip, azurerm_public_ip.ipconfig4-pip, azurerm_public_ip.ipconfig5-pip    ]
   

  ip_configuration {
    name                          = "ipconfug1"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = true
    public_ip_address_id = azurerm_public_ip.ipconfig1-pip.id
    
      }
    ip_configuration {
    name                          = "ipconfig2"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    public_ip_address_id = azurerm_public_ip.ipconfig2-pip.id
      
    }

    ip_configuration {
    name                          = "ipconfig3"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    public_ip_address_id = azurerm_public_ip.ipconfig3-pip.id
      
    }   
    ip_configuration {
    name                          = "ipconfig4"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    public_ip_address_id = azurerm_public_ip.ipconfig4-pip.id
      
    }
    ip_configuration {
    name                          = "ipconfig5"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary = false
    public_ip_address_id = azurerm_public_ip.ipconfig5-pip.id
      
    }  

  tags = {
    environment = "production"
  }
  
}