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

resource "null_resource" "prevent-destroy" {
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [
    module.gitlab_project--k8s-demo,
    module.gitlab_project--terraform,
  ]
}
