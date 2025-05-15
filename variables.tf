variable "domain" {
  type = string
}

variable "reputation-metrics-enabled" {
  type    = bool
  default = "false"
}

variable "create-spf-record" {
  type    = bool
  default = false
}

variable "spf-record" {
  type    = list(string)
  default = ["v=spf1 include:amazonses.com -all"]
}

variable "dkim-record-count" {
  type    = string
  default = "3"
}