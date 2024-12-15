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

variable "tgw_peering_connections" {
  description = "Details for TGW peering connections"
  type        = map(object({
    peer_tgw_id      = string
    peer_account_id  = string
    peer_region      = string
  }))
  default = {}
}

variable "tgw_peering_routes" {
  description = "Routes for TGW peering attachments"
  type        = map(object({
    destination_cidr = string
    route_table_id   = string
  }))
  default = {}
}
