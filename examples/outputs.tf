output "container_group_id" {
  description = "The ID of the created container group"
  value       = module.aci.container_group_id
}

output "container_group_ip_address" {
  description = "The IP address of the created container group"
  value       = module.aci.container_group_ip_address
}

output "container_group_fqdn" {
  description = "The FQDN of the created container group"
  value       = module.aci.container_group_fqdn
}
/*
output "msi_id" {
  description = "MSI Id"
  value       = module.msi.msi_id
}

output "msi_principal_id" {
  description = "MSI principal Id"
  value       = module.msi.msi_principal_id
}

output "msi_name" {
  description = "MSI name"
  value       = module.msi.msi_name
}
*/
