terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.71.0"
    }
  }
}

provider "aws" {
  #secret_key = ""
  #access_key =  ""
  region = var.Region
}