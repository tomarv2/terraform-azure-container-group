output "id" {
  description = "The ID of the created container group"
  value       = [for container in azurerm_container_group.container_group : container.id]
}

output "ip_address" {
  description = "The IP address of the created container group"
  value       = [for container in azurerm_container_group.container_group : container.id]
}

output "fqdn" {
  description = "The FQDN of the created container group"
  value       = [for container in azurerm_container_group.container_group : container.fqdn]
}
