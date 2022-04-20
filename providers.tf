terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.13.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.2.0"
    }
  }
}

variable "gitlab_token" {}
provider "gitlab" {
  base_url = "https://gitlab.sikademo.com/api/v4/"
  token    = var.gitlab_token
}

variable "azurerm_subscription_id" {}
provider "azurerm" {
  features {}
  subscription_id = var.azurerm_subscription_id
}
