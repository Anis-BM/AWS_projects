# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "Arkdev"
      Created     = "Terraform"
    }
  }
}

#Retrieve the list of AZs in the current AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

locals {
  team        = "api_dev"
  application = "corp_api"
  server_name = "ec2_${var.enviroment}_api_${var.variables_sub_az}"
}

