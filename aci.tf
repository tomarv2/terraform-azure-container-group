resource "azurerm_container_group" "containergroup" {
  name                = "${var.teamid}-${var.prjid}"
  location            = var.rg_location
  resource_group_name = local.rgname_create

  count           = var.num_of_containers
  ip_address_type = var.ip_address_type
  dns_name_label  = "${var.teamid}-${var.prjid}"
  os_type         = var.os_type
  restart_policy  = var.restart_policy

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

  identity {
    type         = var.identity_type
    identity_ids = [local.msiname]
  }

  tags = merge(local.shared_tags)
}

