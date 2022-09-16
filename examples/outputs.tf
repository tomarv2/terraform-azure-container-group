output "container_group_id" {
  description = "The ID of the created container group"
  value       = module.container_group.container_group_id
}

output "container_group_ip_address" {
  description = "The IP address of the created container group"
  value       = module.container_group.container_group_ip_address
}

output "container_group_fqdn" {
  description = "The FQDN of the created container group"
  value       = module.container_group.container_group_fqdn
}
