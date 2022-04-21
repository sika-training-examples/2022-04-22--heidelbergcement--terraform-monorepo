variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "tags" {
  type = map(string)
}

variable "azurerm_resource_group" {}
