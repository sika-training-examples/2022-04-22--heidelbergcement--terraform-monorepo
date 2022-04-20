resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = "${var.name}-${each.key}"
  resource_group_name  = var.azurerm_resource_group.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value]
}
