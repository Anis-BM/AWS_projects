output "peering_attachment_id" {
  description = "The ID of the peering attachment"
  value       = aws_ec2_transit_gateway_peering_attachment.this.id
}