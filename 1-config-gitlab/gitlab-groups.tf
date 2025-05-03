locals {
  group_variable_list = {
    "INFLUXDB_TOKEN" : "L6CjnlnrSO1wmcP9biNrpp7VdrED6xQ0", # TODO: start using dynamically
    "INFLUXDB_URL" : "http://influxdb-influxdb2.infrastructure.svc.cluster.local",
    "INFLUXDB_ORG" : "influxdata",
    "INFLUXDB_BUCKET" : "default",
  }
}

resource "gitlab_group" "general" {
  name                = "1-general"
  path                = "1-general"
  auto_devops_enabled = false
  visibility_level    = "public" # TODO: LDAP topic SCRUM-43

  description = "[TF MANAGED] The GitLab group created by Terraform. Avoid any manual modifications."
}

resource "gitlab_group_variable" "influxdb-token" {
  for_each = local.group_variable_list

  key = each.key
  value = each.value

  group = gitlab_group.general.id
  masked = false
  hidden = false # TODO: enable it later
  environment_scope = "*"
}
