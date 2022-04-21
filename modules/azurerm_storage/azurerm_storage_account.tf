resource "azurerm_storage_account" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name                = var.name
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  tags                = var.tags

  account_tier             = "Standard"
  account_replication_type = "GRS"
}
