terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
   backend "s3" {
    bucket         = "ittsecurestore"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
  }
}