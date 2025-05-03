locals {
  project_id   = "chrome-lane-454119-a6"
  region       = "us-central1" # The cheapest region: https://cloudprice.net/gcp/regions
  zones        = ["${local.region}-a"]
  cluster_name = "gke-main"

  data_host                   = "https://${data.google_container_cluster.main.endpoint}"
  data_token                  = data.google_client_config.default.access_token
  data_cluster_ca_certificate = base64decode(data.google_container_cluster.main.master_auth[0].cluster_ca_certificate)
}

data "google_client_config" "default" {}

data "google_container_cluster" "main" {
  name     = local.cluster_name
  location = local.region
}

provider "google" {
  credentials = file("account.json")
  project     = local.project_id
  region      = local.region
  zone        = local.zones[0]
}

# ============================
#        Remote testing
# ============================
provider "kubernetes" {
  host                   = local.data_host
  token                  = local.data_token
  cluster_ca_certificate = local.data_cluster_ca_certificate
}

provider "helm" {
  # Fixed according to: https://github.com/hashicorp/terraform-provider-helm/issues/630#issuecomment-996682323
  repository_config_path = "${path.module}/.helm/repositories.yaml"
  repository_cache       = "${path.module}/.helm"
  kubernetes {
    host                   = local.data_host
    token                  = local.data_token
    cluster_ca_certificate = local.data_cluster_ca_certificate
  }
}
