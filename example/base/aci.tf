module "aci" {
  source = "../.."

  email                                   = var.email
  teamid                                  = var.teamid
  prjid                                   = var.prjid
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  subscription_id                         = var.subscription_id
  tenant_id                               = var.tenant_id

  add_msi                                 = var.add_msi
  msi_name                                = var.msi_name
  add_resourcegroup                       = var.add_resourcegroup
  rg_name                                 = var.rg_name

  cmd                                     = var.cmd
  docker_image                            = var.docker_image
  env_variables                           = var.env_variables
  cpu_allocation                          = var.cpu_allocation
  mem_allocation                          = var.mem_allocation
  container_port                          = var.container_port
  rg_location                             = var.rg_location
}
