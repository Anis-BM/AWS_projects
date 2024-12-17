module "new_york_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_NY_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.New_York }
}

module "Hong_Kong_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_HK_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.Hong_Kong }
}

module "London_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_Lon_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.London }
}

module "sao_paulo_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_SP_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.Sao_Paulo}
}

module "australia_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_Aus_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.Australia }
}

module "california_accepter" {
  source               = "./modules/accepter"
  tgw_attachment_id    = module.tokyo_Cal_peering.peering_attachment_id  # Reference peering_attachment_id from tokyo_peering
  providers            = { aws = aws.California }
}