variable "name" {
  type        = string
  description = "The name of the virtual machine (and network interface)."
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "azurerm_resource_group" {}

variable "size" {
  type        = string
  description = "VM Size. See: https://docs.microsoft.com/en-us/azure/virtual-machines/sizes"
}

variable "public_key" {
  type        = string
  description = "SSH public key. Eg.: cat ~/.ssh/id_rsa.pub"
}

variable "public_ip_address_id" {
  type    = string
  default = null
}
