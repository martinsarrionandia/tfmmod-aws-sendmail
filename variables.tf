variable "domain" {
  type = string
}

variable "reputation-metrics-enabled" {
  type    = bool
  default = "false"
}

variable "dkim-record-count" {
  type    = string
  default = "3"
}