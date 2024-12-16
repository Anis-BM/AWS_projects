resource "aws_ec2_transit_gateway" "this" {
  description       = var.description
  amazon_side_asn   = var.amazon_side_asn
  tags              = var.tags
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_attachment" {
  subnet_ids          = [var.subnet_ids[0]] # Use only the first subnet
  transit_gateway_id  = aws_ec2_transit_gateway.this.id
  vpc_id              = var.vpc_id

  tags = merge(
    var.tags,
    { Name = "VPC-Attachment" }
  )
}

# Transit Gateway Route Table
resource "aws_ec2_transit_gateway_route_table" "this" {
  transit_gateway_id = aws_ec2_transit_gateway.this.id

  tags = merge(
    var.tags,
    { Name = "TGW-Route-Table" }
  )
}

# Associate TGW Route Table with the VPC Attachment
resource "aws_ec2_transit_gateway_route_table_association" "this" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

# Enable Route Propagation for the VPC Attachment
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this.id
}

