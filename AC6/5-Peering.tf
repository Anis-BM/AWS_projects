module "tokyo_NY_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.new_york_tgw.tgw_id
  peer_region        = "us-east-1"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.new_york_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-NewYork-Peering" }
  providers          = { aws = aws.Tokyo }
}

module "tokyo_HK_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.Hong_Kong_tgw.tgw_id
  peer_region        = "ap-east-1"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.Hong_Kong_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-Hong_Kong-Peering" }
  providers          = { aws = aws.Tokyo }
}

module "tokyo_Aus_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.australia_tgw.tgw_id
  peer_region        = "ap-southeast-2"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.australia_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-Australia-Peering" }
  providers          = { aws = aws.Tokyo }
}

module "tokyo_Lon_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.london_tgw.tgw_id
  peer_region        = "eu-west-2"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.london_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-London-Peering" }
  providers          = { aws = aws.Tokyo }
}

module "tokyo_SP_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.sao_paulo_tgw.tgw_id
  peer_region        = "sa-east-1"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.sao_paulo_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-Sao_Paulo-Peering" }
  providers          = { aws = aws.Tokyo }
}
module "tokyo_Cal_peering" {
  source             = "./modules/peering"
  tgw_id             = module.tokyo_tgw.tgw_id
  peer_tgw_id        = module.california_tgw.tgw_id
  peer_region        = "us-west-1"
  peer_account_id    = "123456789012" #Here you must use your account ID
  local_route_table_id = module.tokyo_tgw.transit_gateway_route_table_id
  peer_route_table_id = module.california_tgw.transit_gateway_route_table_id
  tags               = { Environment = "Production", Name = "Tokyo-California-Peering" }
  providers          = { aws = aws.Tokyo }
}