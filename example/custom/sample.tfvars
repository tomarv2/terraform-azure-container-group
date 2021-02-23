email                              = "demo@demo.com"
env_variables                      = {
                                      DEMO_ENV_VAR="1"
                                      }
container_port                     = "80"
docker_image                       = "nginx"
#
# NOTE: If add_resourcegroup is false, provide existing resource group name
add_resourcegroup                  = false
rg_name                            = "demo-rg"
# NOTE: If add_msi is false, provide existing msi_name
add_msi                            = false
msi_name                           = "/subscriptions/12345/resourceGroups/demo-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/rumse-demo-identity"
#-------------------------------------------------------------------
# Note: Do not change teamid and prjid once set.
teamid                             = "rumse"
prjid                              = "demo-aci"

