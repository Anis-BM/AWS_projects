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

output "public_ip1" {
  description = "This is the public IP of my web server"
  value = aws_instance.ubuntu_server.public_ip
}

output "ec2_instance_arn" {
  value = aws_instance.ubuntu_server.arn
  sensitive = true
}


output "phone_number" {
  value     = var.phone_number
  sensitive = true
}

output "data-bucket-arn" {
  value = data.aws_s3_bucket.data_bucket.arn
}

output "data-bucket-domain-name" {
  value = data.aws_s3_bucket.data_bucket.bucket_domain_name
}

output "data-bucket-region" {
  value = "The ${data.aws_s3_bucket.data_bucket.id} bucket is located in ${data.aws_s3_bucket.data_bucket.region}"
}

output "max_value" {
  value = local.maximum
}

output "min_value" {
  value = local.minimum
}