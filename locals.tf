locals {
  relay_name = replace(var.domain, ".", "_")
  region     = data.aws_region.this.name
  mx_record  = "feedback-smtp.${local.region}.amazonses.com"
}