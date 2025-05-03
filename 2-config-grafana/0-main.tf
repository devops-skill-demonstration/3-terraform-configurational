resource "grafana_data_source" "influxdb" {
  type = "influxdb"
  name = "influxdb"
  url  = "http://influxdb-influxdb2.infrastructure.svc.cluster.local"

  json_data_encoded = jsonencode({
    "version"       = "Flux"
    "organization"  = "influxdata"
    "defaultBucket" = "default"
    "tlsSkipVerify" = true
  })

  secure_json_data_encoded = jsonencode({
    "token" : "L6CjnlnrSO1wmcP9biNrpp7VdrED6xQ0" # TODO: replace the token by a senvisitive secret value
  })

}
