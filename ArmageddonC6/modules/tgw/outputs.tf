output "tgw_id" {
  description = "ID of the created Transit Gateway"
  value       = aws_ec2_transit_gateway.this.id
}

output "tgw_attachment_id" {
  description = "ID of the VPC attachment"
  value       = aws_ec2_transit_gateway_vpc_attachment.vpc_attachment.id
}
