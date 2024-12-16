variable "tgw_id" {
  description = "The ID of the local Transit Gateway"
  type        = string
}

variable "peer_tgw_id" {
  description = "The ID of the peer Transit Gateway"
  type        = string
}

variable "peer_region" {
  description = "The region of the peer Transit Gateway"
  type        = string
}

variable "peer_account_id" {
  description = "The AWS account ID of the peer"
  type        = string
}

variable "local_route_table_id" {
  description = "The ID of the local Transit Gateway route table"
  type        = string
}

variable "peer_route_table_id" {
  description = "The ID of the peer Transit Gateway route table"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}
