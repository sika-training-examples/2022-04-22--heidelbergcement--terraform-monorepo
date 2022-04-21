resource "azurerm_public_ip" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name                = var.name
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  tags                = var.tags
  allocation_method   = "Static"
}
