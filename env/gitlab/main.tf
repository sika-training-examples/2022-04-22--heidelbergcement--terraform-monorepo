module "gitlab_project--k8s-demo" {
  source       = "../../modules/gitlab_project"
  namespace_id = 1
  name         = "k8s-demo"
}

module "gitlab_project--terraform" {
  source       = "../../modules/gitlab_project"
  namespace_id = 1
  name         = "terraform"
}
