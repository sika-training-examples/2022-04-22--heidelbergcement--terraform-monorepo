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
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCslNKgLyoOrGDerz9pA4a4Mc+EquVzX52AkJZz+ecFCYZ4XQjcg2BK1P9xYfWzzl33fHow6pV/C6QC3Fgjw7txUeH7iQ5FjRVIlxiltfYJH4RvvtXcjqjk8uVDhEcw7bINVKVIS856Qn9jPwnHIhJtRJe9emE7YsJRmNSOtggYk/MaV2Ayx+9mcYnA/9SBy45FPHjMlxntoOkKqBThWE7Tjym44UNf44G8fd+kmNYzGw9T5IKpH1E1wMR+32QJBobX6d7k39jJe8lgHdsUYMbeJOFPKgbWlnx9VbkZh+seMSjhroTgniHjUl8wBFgw0YnhJ/90MgJJL4BToxu9PVnH"
  runners = {
    "0" = {
      size = "Standard_B1s"
    }
    "1" = {
      size = "Standard_B1s"
    }
  }
}


module "azurerm_resource_group--net" {
  source = "../../modules/azurerm_resource_group"
  name   = "net"
  tags   = merge(local.tags_global, local.tags_billing_1)
}


module "azurerm_network--primary" {
  source                 = "../../modules/azurerm_network"
  name                   = "example-dev-primary"
  tags                   = merge(local.tags_global, local.tags_billing_1)
  azurerm_resource_group = module.azurerm_resource_group--net.azurerm_resource_group
  address_space          = "10.250.0.0/16"
  subnets = {
    "vms" = "10.250.0.0/24"
    "k8s" = "10.250.1.0/24"
  }
}

module "azurerm_resource_group--vm" {
  source = "../../modules/azurerm_resource_group"
  name   = "vm"
  tags   = merge(local.tags_global, local.tags_billing_1)
}

module "azurerm_public_ip--runner" {
  for_each               = local.runners
  source                 = "../../modules/azurerm_public_ip"
  name                   = "runner${each.key}"
  tags                   = merge(local.tags_global, local.tags_billing_1)
  azurerm_resource_group = module.azurerm_resource_group--vm.azurerm_resource_group
}

module "azurerm_linux_virtual_machine--runner" {
  depends_on = [
    module.azurerm_public_ip--runner,
  ]
  for_each               = local.runners
  source                 = "../../modules/azurerm_linux_virtual_machine"
  name                   = "runner${each.key}"
  tags                   = merge(local.tags_global, local.tags_billing_1)
  azurerm_resource_group = module.azurerm_resource_group--vm.azurerm_resource_group
  subnet_id              = module.azurerm_network--primary.subnet_ids["vms"]
  size                   = each.value["size"]
  public_key             = local.ssh_public_key
  public_ip_address_id   = module.azurerm_public_ip--runner[each.key].id
}

output "runner_ips" {
  value = {
    for key, val in module.azurerm_public_ip--runner :
    key => val.ip
  }
}
