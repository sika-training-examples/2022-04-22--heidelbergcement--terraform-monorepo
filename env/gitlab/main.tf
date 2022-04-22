module "gitlab_project--k8s-demo" {
  source       = "../../modules/gitlab_project"
  namespace_id = 1
  name         = "k8s-demo"
}

module "gitlab_project--terraform" {
  source                = "../../modules/gitlab_project"
  namespace_id          = 1
  name                  = "terraform"
  unprotected_variables = var.config.ci_arm_config
  unprotected_file_variables = {
    "variables_auto_tfvars" = file("variables.auto.tfvars")
    "providers_auto_tfvars" = file("providers.auto.tfvars")
  }
}

resource "null_resource" "prevent-destroy" {
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [
    module.gitlab_project--k8s-demo,
    module.gitlab_project--terraform,
  ]
}
