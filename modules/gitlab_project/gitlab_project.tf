terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.13.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

variable "namespace_id" {
  type        = number
  description = "The namespace (group or user) of the project."
}

variable "name" {
  type        = string
  description = "The name of the project."
}

variable "visibility_level" {
  type        = string
  description = "Use `public` or `private`"
  default     = "public"
}

resource "gitlab_project" "this" {
  namespace_id                     = var.namespace_id
  name                             = var.name
  visibility_level                 = var.visibility_level
  initialize_with_readme           = false
  merge_method                     = "ff"
  default_branch                   = "master"
  remove_source_branch_after_merge = true
}

resource "null_resource" "prevent-destroy" {
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [
    gitlab_project.this
  ]
}
