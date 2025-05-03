locals {
  kubernetes_config_path    = "~/.kube/config" # TODO: set up kubernetes provider
  kubernetes_config_context = "docker-desktop" # TODO: set up kubernetes provider
}

# ============================
#        Local testing
# ============================
provider "kubernetes" {
  config_path    = local.kubernetes_config_path
  config_context = local.kubernetes_config_context
}

provider "helm" {
  repository_config_path = "${path.module}/.helm/repositories.yaml"
  repository_cache       = "${path.module}/.helm"
  kubernetes {
    config_path    = local.kubernetes_config_path
    config_context = local.kubernetes_config_context
  }
}
