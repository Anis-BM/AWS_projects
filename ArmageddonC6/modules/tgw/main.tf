resource "aws_ec2_transit_gateway" "this" {
  description       = var.description
  amazon_side_asn   = var.amazon_side_asn
  tags              = var.tags
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  subnet_ids          = var.subnet_ids
  transit_gateway_id  = aws_ec2_transit_gateway.this.id
  vpc_id              = var.vpc_id


  tags = merge(
    var.tags,
    { Name = "VPC-Attachment" }
  )
}

