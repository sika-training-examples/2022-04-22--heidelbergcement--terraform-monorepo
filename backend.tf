terraform {
  backend "azurerm" {
    resource_group_name  = "terraform_state"
    storage_account_name = "terraform58nbdc"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}
