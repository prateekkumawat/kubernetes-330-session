terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.71.0"
    }
  }
  backend "s3" {
    bucket = "hsit-terraform-tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  #secret_key = ""
  #access_key =  ""
  region = var.Region
}