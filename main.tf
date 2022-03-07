resource "azurerm_container_group" "container_group" {
  name = "${var.teamid}-${var.prjid}"

  resource_group_name = var.resource_group_name
  location            = var.location
  count               = var.num_of_containers
  ip_address_type     = var.ip_address_type
  dns_name_label      = "${var.teamid}-${var.prjid}"
  os_type             = var.os_type
  restart_policy      = var.restart_policy

  container {
    name                  = "${var.teamid}-${var.prjid}-${count.index}"
    image                 = var.docker_image
    cpu                   = var.cpu_allocation
    memory                = var.mem_allocation
    environment_variables = var.env_variables
    commands              = var.cmd
    ports {
      port     = var.container_port
      protocol = var.container_protocol
    }
  }

  /*
  Optional block: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group
  identity {
    type         = var.identity_type
    identity_ids = [var.msi_name]
  }
  */
  tags = merge(local.shared_tags)
}
