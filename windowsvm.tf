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
resource "azurerm_windows_virtual_machine" "windowsVM" {
  name                = "WindowsVM"
  resource_group_name = azurerm_resource_group.prodrg.name
  location            = azurerm_resource_group.prodrg.location
  size                = "Standard_DS1_v2"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  
  network_interface_ids = [
    azurerm_network_interface.windowsVMNIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

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

resource "azurerm_public_ip" "windowsvmpip" {
  name                = "WindowsVMPIP"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name
  allocation_method   = "Dynamic"
  
}