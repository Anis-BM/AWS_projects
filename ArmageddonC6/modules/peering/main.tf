resource "aws_ec2_transit_gateway_peering_attachment" "this" {
  transit_gateway_id      = var.tgw_id
  peer_transit_gateway_id = var.peer_tgw_id
  peer_account_id         = var.peer_account_id
  peer_region             = var.peer_region

  tags = merge(
    var.tags,
    { Name = "TGW-Peering" }
  )
}
