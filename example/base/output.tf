output "containergroup_id" {
  description = "The ID of the created container group"
  value = module.aci.containergroup_id
}

output "containergroup_ip_address" {
  description = "The IP address of the created container group"
  value = module.aci.containergroup_ip_address
}

output "containergroup_fqdn" {
  description = "The FQDN of the created container group"
  value = module.aci.containergroup_fqdn
}

output "resourcegroup_name" {
  description = "Resoure Group name"
  value = module.aci.resource_group
}


output "msi_id" {
  description = "The MSI id"
  value = module.aci.msi_id
}

output "msi_principal_id" {
  value = module.aci.msi_principal_id
}

output "msi_name" {
  value = module.aci.msi_name
}