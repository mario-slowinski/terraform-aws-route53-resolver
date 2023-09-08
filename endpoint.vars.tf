variable "endpoints" {
  type = list(object({
    direction = string             # The direction of DNS queries to or from the Route 53 Resolver endpoint. Valid values are INBOUND or OUTBOUND.
    ip_addresses = list(object({   # The subnets and IP addresses in your VPC that you want DNS queries to pass through on the way from your VPCs to your network (for outbound endpoints) or on the way from your network to your VPCs (for inbound endpoints).
      subnet_id = string           # The ID of the subnet that contains the IP address.
      ip        = optional(string) # The IP address in the subnet that you want to use for DNS queries.
    }))
    name               = optional(string)       # The friendly name of the Route 53 Resolver endpoint.
    security_group_ids = optional(list(string)) # The ID of one or more security groups that you want to use to control access to this VPC.
    tags               = optional(map(string))  # A map of tags to assign to the resource.
  }))
  description = "List of Route 53 Resolver endpoints."
  default     = [{ direction = null, ip_addresses = [{ subnet_id = null }] }]
}
