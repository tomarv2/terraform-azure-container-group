output "containergroup_id" {
  description = "The ID of the created container group"
  value       = azurerm_container_group.containergroup.*.id
}

output "containergroup_ip_address" {
  description = "The IP address of the created container group"
  value       = azurerm_container_group.containergroup.*.ip_address
}

output "containergroup_fqdn" {
  description = "The FQDN of the created container group"
  value       = azurerm_container_group.containergroup.*.fqdn
}

output "resource_group" {
  description = "Resoure Group name"
  value       = module.resourcegroup.resourcegroup_name
}

output "msi_id" {
  description = "The msi id"
  value       = module.msi.msi_id
}

output "msi_principal_id" {
  value = module.msi.msi_principal_id
}

output "msi_name" {
  value = module.msi.msi_name
}
