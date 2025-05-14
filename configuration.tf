resource "aws_ses_configuration_set" "config_set" {

  name                       = replace(var.domain, ".", "_")
  reputation_metrics_enabled = var.reputation-metrics-enabled
  sending_enabled            = true

  delivery_options {
    tls_policy = "Require"
  }
}