variable "name" {
  type        = string
  description = "The name of the virtual network."
}

variable "address_space" {
  type        = string
  description = "IP address space in format \"10.0.0.0/16\""
}

variable "tags" {
  type = map(string)
}

variable "azurerm_resource_group" {}
