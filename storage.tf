

resource "azurerm_storage_account" "demostorage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.prodrg.name
  location                 = azurerm_resource_group.prodrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
