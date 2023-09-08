resource "aws_route53_resolver_endpoint" "name" {
  for_each = {
    for endpoint in var.endpoints :
    coalesce(endpoint.name, endpoint.direction) => endpoint
    if endpoint.direction != null
  }

  direction          = each.value.direction
  name               = each.value.name
  security_group_ids = each.value.security_group_ids
  tags               = each.value.tags

  dynamic "ip_address" {
    for_each = { for ip_address in each.value.ip_addresses : ip_address.subnet_id => ip_address }
    content {
      subnet_id = ip_address.value.subnet_id
      ip        = ip_address.value.ip
    }
  }
}
