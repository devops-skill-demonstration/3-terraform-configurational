terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.20.0"
    }
  }
}

provider "grafana" {
  url  = "http://grafana.ci.alytvynenko.net/"
  auth = "admin:admin" # TODO: use admin username and password here "username:password"
}
