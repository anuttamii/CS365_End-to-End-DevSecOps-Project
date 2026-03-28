terraform {
  backend "s3" {
    bucket       = "tetris-terraform-state-cs366"
    region       = "us-east-1"
    key          = "eks/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
  }
  required_version = ">=1.14.0"
  required_providers {
    aws = {
      version = ">= 5.49.0"
      source  = "hashicorp/aws"
    }
  }
}