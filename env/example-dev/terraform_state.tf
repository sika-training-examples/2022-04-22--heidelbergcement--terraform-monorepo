module "azurerm_resource_group--terraform-state" {
  source = "../../modules/azurerm_resource_group"
  name   = "terraform_state"
  tags   = merge(local.tags_global, local.tags_billing_1)
}
