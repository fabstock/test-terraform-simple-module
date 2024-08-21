terraform {

 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {
    path = "terraform.tfstate"
  }

}



provider "aws" {
  profile                     = "localstack"
  access_key                  = "test"
  secret_key                  = "test"
  skip_requesting_account_id  = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true

  #alias                       = "us_east"

  #region                      = "us-east-1"
  region  = var.aws_region
}


resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "Project VPC"
 }
}



