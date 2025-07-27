resource "azurerm_network_interface" "linuxVMNIC" {
  name                = "LinuxVMNIC"
  location            = azurerm_resource_group.prodrg.location
  resource_group_name = azurerm_resource_group.prodrg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.ProductionSubnet.id
    private_ip_address_allocation = "Dynamic"
    primary                       = true
  }

  tags = {
    environment = "production"
  }
  
}

resource "azurerm_linux_virtual_machine" "linuxVM" {
  name                = "AnsibleVM"
  resource_group_name = azurerm_resource_group.prodrg.name
  location            = azurerm_resource_group.prodrg.location
  size                = "Standard_D2s_v3"
  admin_username      = var.admin_username
  

  network_interface_ids = [
    azurerm_network_interface.linuxVMNIC.id,
    
  ]

    admin_ssh_key {
        username   = var.admin_username
        public_key = var.admin_ssh_public_key
    }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    environment = "production"
  }
}