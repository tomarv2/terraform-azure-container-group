resource "azurerm_container_group" "container_group" {
  name                = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
  resource_group_name = var.resource_group
  location            = var.location
  count               = var.num_of_containers
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label != null ? var.dns_name_label : "${var.teamid}-${var.prjid}"
  os_type             = var.os_type
  restart_policy      = var.restart_policy
  exposed_port        = var.exposed_port

  dynamic "container" {
    for_each = var.containers_config

    content {
      name                         = container.key
      image                        = container.value.image
      cpu                          = container.value.cpu
      memory                       = container.value.memory
      environment_variables        = lookup(container.value, "environment_variables", null)
      secure_environment_variables = lookup(container.value, "secure_environment_variables", null)
      commands                     = lookup(container.value, "commands", null)

      dynamic "ports" {
        for_each = container.value.ports

        content {
          port     = ports.value.port
          protocol = ports.value.protocol
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity

    content {
      identity_ids = [identity.key]
      type         = coalesce(identity.value.type, "UserAssigned")
    }
  }
  tags = merge(var.extra_tags, local.shared_tags)
}


