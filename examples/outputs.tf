#output "id" {
#  description = "The ID of the created container group"
#  value       = module.container_group.id
#}
#
#output "ip_address" {
#  description = "The IP address of the created container group"
#  value       = module.container_group.ip_address
#}
#
#output "fqdn" {
#  description = "The FQDN of the created container group"
#  value       = module.container_group.fqdn
#}

output "container_config" {
  value = module.container_group.test
}