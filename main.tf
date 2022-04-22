module "env--gitlab" {
  source = "./env/gitlab"
  config = {
    ci_arm_config     = var.ci_arm_config
    INFRACOST_API_KEY = var.INFRACOST_API_KEY
    GITLAB_TOKEN      = var.gitlab_token
  }
}

module "env--example-dev" {
  source = "./env/example-dev"
  config = {
    gitlab_registration_token = var.gitlab_registration_token
  }
}

output "example-dev" {
  value = module.env--example-dev
}
