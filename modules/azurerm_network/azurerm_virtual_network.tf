resource "azurerm_virtual_network" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name                = var.name
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  address_space       = [var.address_space]
  tags                = var.tags
}
