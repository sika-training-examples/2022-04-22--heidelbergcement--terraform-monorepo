resource "azurerm_linux_virtual_machine" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name                = var.name
  location            = var.azurerm_resource_group.location
  resource_group_name = var.azurerm_resource_group.name
  tags                = var.tags

  size           = var.size
  admin_username = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.this.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.public_key
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
