resource "grafana_dashboard" "application_pipeline_monitoring" {
  config_json = "${file("${path.module}/application-pipeline-monitoring.json")}"
}