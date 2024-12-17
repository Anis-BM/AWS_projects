module "tokyo_tgw" {
  source           = "./modules/tgw"
  description      = "Tokyo Transit Gateway"
  amazon_side_asn  = 64512
  vpc_id           = module.tokyo_network.vpc_id
  subnet_ids       = module.tokyo_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "Tokyo-TGW" }
  providers = { aws = aws.Tokyo }
}

module "new_york_tgw" {
  source           = "./modules/tgw"
  description      = "New_York Transit Gateway"
  amazon_side_asn  = 64513
  vpc_id           = module.new_york_network.vpc_id
  subnet_ids       = module.new_york_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "New_York-TGW" }
  providers = { aws = aws.New_York }
}

module "Hong_Kong_tgw" {
  source           = "./modules/tgw"
  description      = "Hong_Kong Transit Gateway"
  amazon_side_asn  = 64514
  vpc_id           = module.Hong_Kong_network.vpc_id
  subnet_ids       = module.Hong_Kong_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "Hong_Kong-TGW" }
  providers = { aws = aws.Hong_Kong }
}

module "australia_tgw" {
  source           = "./modules/tgw"
  description      = "Australia Transit Gateway"
  amazon_side_asn  = 64515
  vpc_id           = module.australia_network.vpc_id
  subnet_ids       = module.australia_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "Australia-TGW" }
  providers = { aws = aws.Australia }
}

module "london_tgw" {
  source           = "./modules/tgw"
  description      = "London Transit Gateway"
  amazon_side_asn  = 64516
  vpc_id           = module.london_network.vpc_id
  subnet_ids       = module.london_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "London-TGW" }
  providers = { aws = aws.London }
}

module "sao_paulo_tgw" {
  source           = "./modules/tgw"
  description      = "Sao_Paulo Transit Gateway"
  amazon_side_asn  = 64517
  vpc_id           = module.sao_paulo_network.vpc_id
  subnet_ids       = module.sao_paulo_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "Sao_Paulo-TGW" }
  providers = { aws = aws.Sao_Paulo }
}

module "california_tgw" {
  source           = "./modules/tgw"
  description      = "California Transit Gateway"
  amazon_side_asn  = 64518
  vpc_id           = module.california_network.vpc_id
  subnet_ids       = module.california_network.public_subnet_ids
  tags             = { Environment = "Production", Name = "California-TGW" }
  providers = { aws = aws.California }
}