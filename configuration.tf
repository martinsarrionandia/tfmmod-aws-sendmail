resource "aws_ses_configuration_set" "this" {

  name                       = local.relay_name
  reputation_metrics_enabled = var.reputation-metrics-enabled
  sending_enabled            = true

  delivery_options {
    tls_policy = "Require"
  }
}