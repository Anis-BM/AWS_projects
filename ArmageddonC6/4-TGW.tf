module "tokyo_tgw" {
  source           = "./modules/tgw"
  description      = "Tokyo Transit Gateway"
  amazon_side_asn  = 64512
  vpc_id           = module.tokyo_network.vpc_id
  subnet_ids       = concat(module.tokyo_network.private_subnet_ids, module.tokyo_network.public_subnet_ids)
  tags             = { Environment = "Production", Name = "Tokyo-TGW" }
  providers = { aws = aws.Tokyo }
}
