resource "aws_ec2_transit_gateway" "tokyo_TGW" {
  description = "example"
  provider = aws.Tokyo
}