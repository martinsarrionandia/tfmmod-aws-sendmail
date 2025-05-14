terraform {
  backend "s3" {
    bucket  = "djmaddox.co.uk"
    key     = "terraform-state/tfm-dev/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}