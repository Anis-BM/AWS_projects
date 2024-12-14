module "tokyo_network" {
  source               = "./modules/network"
  cidr_block           = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  availability_zones   = ["ap-northeast-1a", "ap-northeast-1c"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "Tokyo", Project = "IMMCstage1", "Name" ="Tokyo" }
  providers            = { aws = aws.Tokyo }
}

module "new_york_network" {
  source               = "./modules/network"
  cidr_block           = "10.1.0.0/16"
  public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnet_cidrs = ["10.1.11.0/24", "10.1.12.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "New York", Project = "IMMCstage1", "Name" ="NewYork" }
  providers            = { aws = aws.New_York }
}

module "Hong_Kong_network" {
  source               = "./modules/network"
  cidr_block           = "10.2.0.0/16"
  public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24"]
  private_subnet_cidrs = ["10.2.11.0/24", "10.2.12.0/24"]
  availability_zones   = ["ap-east-1a", "ap-east-1b"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "Hong_kong", Project = "IMMCstage1", "Name" ="Hong_Kong" }
  providers            = { aws = aws.Hong_Kong }
}

module "london_network" {
  source               = "./modules/network"
  cidr_block           = "10.3.0.0/16"
  public_subnet_cidrs  = ["10.3.1.0/24", "10.3.2.0/24"]
  private_subnet_cidrs = ["10.3.11.0/24", "10.3.12.0/24"]
  availability_zones   = ["eu-west-2a", "eu-west-2b"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "London", Project = "IMMCstage1", "Name" ="London" }
  providers            = { aws = aws.London }
}

module "australia_network" {
  source               = "./modules/network"
  cidr_block           = "10.4.0.0/16"
  public_subnet_cidrs  = ["10.4.1.0/24", "10.4.2.0/24"]
  private_subnet_cidrs = ["10.4.11.0/24", "10.4.12.0/24"]
  availability_zones   = ["ap-southeast-2a", "ap-southeast-2c"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "Australia", Project = "IMMCstage1", "Name" ="Australia" }
  providers            = { aws = aws.Australia }
}

module "sao_paulo_network" {
  source               = "./modules/network"
  cidr_block           = "10.5.0.0/16"
  public_subnet_cidrs  = ["10.5.1.0/24", "10.5.2.0/24"]
  private_subnet_cidrs = ["10.5.11.0/24", "10.5.12.0/24"]
  availability_zones   = ["sa-east-1a", "sa-east-1b"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "Sao Paulo", Project = "IMMCstage1", "Name" ="Sao_Paulo" }
  providers            = { aws = aws.Sao_Paulo }
}

module "california_network" {
  source               = "./modules/network"
  cidr_block           = "10.6.0.0/16"
  public_subnet_cidrs  = ["10.6.1.0/24", "10.6.2.0/24"]
  private_subnet_cidrs = ["10.6.11.0/24", "10.6.12.0/24"]
  availability_zones   = ["us-west-1a", "us-west-1b"]
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { "Module" = "Network", "Region" = "California", Project = "IMMCstage1", "Name" ="California" }
  providers            = { aws = aws.California }
}