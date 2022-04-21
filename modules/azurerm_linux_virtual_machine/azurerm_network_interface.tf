resource "azurerm_network_interface" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name                = var.name
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}
