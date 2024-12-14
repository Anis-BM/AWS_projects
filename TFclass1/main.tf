resource "random_pet" "server" {
  length = 2
}


resource "aws_vpc" "vpc" {

  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    Environment = "test-dev"
    Terraform   = "true"
  }
}