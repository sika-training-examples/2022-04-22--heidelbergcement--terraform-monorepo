terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.13.0"
    }
  }
}

module "gitlab_project--k8s-demo" {
  source       = "../../modules/gitlab_project"
  namespace_id = 1
  name         = "k8s-demo"
}
