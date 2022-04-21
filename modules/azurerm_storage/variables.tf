variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "tags" {
  type = map(string)
}

variable "azurerm_resource_group" {}

variable "containers" {
  type        = map(string)
  description = "Map of azurerm_storage_container in format like {name = container_access_type}"
}
