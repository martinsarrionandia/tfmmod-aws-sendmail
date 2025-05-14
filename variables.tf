variable "domain" {
  type    = string
  default = "djmaddox.co.uk"
}

variable "reputation-metrics-enabled" {
  type    = bool
  default = "false"
}

variable "dkim-record-count" {
  type    = string
  default = "3"
}