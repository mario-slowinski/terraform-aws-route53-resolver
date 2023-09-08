locals {
  endpoints = { for name, endpoint in aws_route53_resolver_endpoint.name : name => endpoint }
}
