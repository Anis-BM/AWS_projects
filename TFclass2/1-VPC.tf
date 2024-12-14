#Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    Environment = "demo_environment"
    Terraform   = "true"
    Region      = data.aws_region.current.name
  }
/*     lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
  }
 */
}
/* #Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = upper(var.vpc_name)
    Environment = upper(var.enviroment)
    Terraform   = upper("true")
  }

  enable_dns_hostnames = true
} */