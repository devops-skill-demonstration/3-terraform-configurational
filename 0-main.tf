locals {
  infrastructure_namespace = "infrastructure"
}

module "config-gitlab" {
  source = "./1-config-gitlab"
  namespace = local.infrastructure_namespace
  gitlab_token = var.gitlab_token
}

module "config-grafana" {
  source = "./2-config-grafana"
  namespace = local.infrastructure_namespace
}