module "azurerm_resource_group--terraform-state" {
  source = "../../modules/azurerm_resource_group"
  name   = "terraform_state"
  tags   = merge(local.tags_global, local.tags_billing_1)
}

module "azurerm_storage--terraform-state" {
  source                 = "../../modules/azurerm_storage"
  name                   = "terraform58nbdc"
  tags                   = merge(local.tags_global, local.tags_billing_1)
  azurerm_resource_group = module.azurerm_resource_group--terraform-state.azurerm_resource_group
  containers = {
    terraform = "private"
  }
}

resource "azurerm_management_lock" "terraform-state" {
  lifecycle {
    prevent_destroy = true
  }
  name       = "terraform-state"
  scope      = module.azurerm_storage--terraform-state.id
  lock_level = "CanNotDelete"
  notes      = "Can't delete Terraform state!"
}
