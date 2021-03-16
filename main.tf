locals {
  rgname        = var.add_resourcegroup != true ? var.rg_name : module.resourcegroup.resourcegroup_name[0]
  rgname_create = coalesce(var.rg_name, "${var.teamid}-${var.prjid}")

  msiname = var.add_msi == false ? var.msi_name : module.msi.msi_id[0]
}

module "resourcegroup" {
  source = "git::git@github.com:tomarv2/terraform-azure-resource-group.git"

  add_resourcegroup = var.add_resourcegroup # FEATURE FLAG

  rg_name         = local.rgname_create
  teamid          = var.teamid
  prjid           = var.prjid
  client_id       = var.client_id
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret
  rg_location     = var.rg_location
}

module "msi" {
  source = "git::git@github.com:tomarv2/terraform-azure-msi.git"

  add_msi = var.add_msi # FEATURE FLAG

  teamid          = var.teamid
  prjid           = var.prjid
  client_id       = var.client_id
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_secret   = var.client_secret
  rg_name         = local.rgname
  msi_location    = var.rg_location

  msi_depends_on = local.rgname
}

module "role_assignment" {
  source = "git::git@github.com:tomarv2/terraform-azure-role-assignment.git"

  teamid          = var.teamid
  prjid           = var.prjid
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  principal_id    = module.msi.msi_principal_id
  scopes          = var.scopes
}

locals {
  shared_tags = map(
    "name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )
}
