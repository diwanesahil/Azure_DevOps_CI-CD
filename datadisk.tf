
resource "azurerm_managed_disk" "DataDisk1" {
  name                 = "DataDisk1"
  location             = azurerm_resource_group.prodrg.location
  resource_group_name  = azurerm_resource_group.prodrg.name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 10
  create_option = "Empty"

  tags = {
    environment = "staging"
  }
  
}

resource "azurerm_virtual_machine_data_disk_attachment" "diskattachment" {
    managed_disk_id    = azurerm_managed_disk.DataDisk1.id
    virtual_machine_id = azurerm_windows_virtual_machine.windowsVM.id
    lun                 = 0
    caching             = "ReadWrite"
    
    depends_on = [
        azurerm_windows_virtual_machine.windowsVM,
        azurerm_managed_disk.DataDisk1
    ]
  
}