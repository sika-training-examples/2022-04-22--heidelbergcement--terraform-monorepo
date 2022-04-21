module "env--gitlab" {
  source = "./env/gitlab"
}

module "env--example-dev" {
  source = "./env/example-dev"
}

output "example-dev" {
  value = module.env--example-dev
}
