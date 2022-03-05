module "aci" {
  source = "../"

  add_msi           = true
  add_resourcegroup = true
  rg_name           = "demo-rg"
  docker_image      = "nginx"
  container_port    = "80"
  scopes            = "scopes"
  env_variables = {
    DEMO_ENV_VAR = "1"
  }
  # ---------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
