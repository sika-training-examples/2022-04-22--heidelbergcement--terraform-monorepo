output "subnet_ids" {
  value = {
    for key, val in azurerm_subnet.this :
    key => val.id
  }
}
