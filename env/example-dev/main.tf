locals {
  tags_global = {
    ApplicationName = "Example"
    BillingID       = "1"
    Environment     = "Dev"
    CreationDate    = formatdate("DD.MM.YYYY", timestamp())
  }
  tags_billing_1 = {
    BillingID = "1"
  }
  tags_billing_2 = {
    BillingID = "2"
  }
}


module "azurerm_resource_group--net" {
  source = "../../modules/azurerm_resource_group"
  name   = "net"
  tags   = merge(local.tags_global, local.tags_billing_1)
}
