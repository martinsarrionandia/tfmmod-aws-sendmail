# AWS Provider 
provider "aws" {
  region = "eu-west-2"
  default_tags {
    tags = {
      Environment = "Container"
      Managedby   = "Terraform"
      Rancher     = "True"
    }
  }
}