terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }
  }
}

variable "name" {
  type        = string
  description = "The name of the resource group."
}

variable "tags" {
  type = map(string)
}


resource "azurerm_resource_group" "this" {
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  name     = var.name
  location = "West Europe"
  tags     = var.tags
}

output "azurerm_resource_group" {
  value = azurerm_resource_group.this
}

output "id" {
  value = azurerm_resource_group.this.id
}
