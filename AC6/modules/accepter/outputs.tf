output "peering_attachment_id" {
  description = "The ID of the peering attachment created by the accepter"
  value       = aws_ec2_transit_gateway_peering_attachment_accepter.this.id
}
