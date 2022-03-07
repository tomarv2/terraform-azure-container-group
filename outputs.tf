output "container_group_id" {
  description = "The ID of the created container group"
  value       = azurerm_container_group.container_group.*.id
}

output "container_group_ip_address" {
  description = "The IP address of the created container group"
  value       = azurerm_container_group.container_group.*.ip_address
}

output "container_group_fqdn" {
  description = "The FQDN of the created container group"
  value       = azurerm_container_group.container_group.*.fqdn
}
