# Will Display a message
output "hello-world" {
  description = "Print a Welcome text output"
  value       = "Morning Architect! Lets Get to Building!"
}

# Will output the VPC ID
output "vpc_id" {
  description = "Output the ID for the primary VPC"
  value       = aws_vpc.vpc.id
}

# Will output the Public URL
output "public_url" {
  description = "Public URL for our Web Server"
  value       = "https://${aws_instance.ubuntu_server.public_ip}:8080/index.html"
}

output "vpc_information" {
  description = "VPC Information about Environment"
  value       = "Your ${aws_vpc.vpc.tags.Environment} VPC has an ID of ${aws_vpc.vpc.id}"
}

output "public_ip" {
  value = module.server.public_ip
}

output "public_dns" {
  value = module.server.public_dns
}

/*output "public_ip_sub1" {
  value = module.server_subnet_1.public_ip
}

output "public_dns_sub1" {
  value = module.server_subnet_1.public_dns
}*/