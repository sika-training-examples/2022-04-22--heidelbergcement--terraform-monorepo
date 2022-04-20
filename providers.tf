terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.13.0"
    }
  }
}

variable "gitlab_token" {}
provider "gitlab" {
  base_url = "https://gitlab.sikademo.com/api/v4/"
  token    = var.gitlab_token
}
