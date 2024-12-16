variable "description" {
  description = "Description of the transit gateway"
  type        = string
}

variable "amazon_side_asn" {
  description = "ASN for the Amazon side of the gateway"
  type        = number
  default     = 64512
}

variable "vpc_id" {
  description = "ID of the VPC to attach"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to attach to the transit gateway"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the transit gateway"
  type        = map(string)
}