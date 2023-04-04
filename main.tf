locals {
  containers_config = flatten([
    for container_group, config in var.config : [
      for container, settings in config.containers_config : {
        identity     = config.identity
        name                         = container
        image                        = settings.image
        cpu                          = settings.cpu
        memory                       = settings.memory
        environment_variables        = try(settings.environment_variables, null)
        secure_environment_variables = try(settings.secure_environment_variables, null)
        commands                     = try(settings.commands, null)
        ports                     = try(settings.ports, [])
      }
    ]
  ])
}

resource "azurerm_container_group" "container_group" {
  for_each = var.config
  name                = each.key
  resource_group_name = each.value.resource_group
  location            = try(each.value.location, "westus2")
  ip_address_type     = try(each.value.ip_address_type, "Public")
  dns_name_label      = try(each.value.dns_name_label, each.key)
  os_type             = try(each.value.os_type, "Linux")
  restart_policy      = try(each.value.restart_policy, "OnFailure")
  exposed_port        = try(each.value.exposed_port, [])

  dynamic "container" {
    for_each = local.containers_config

    content {
      name                         = container.value.name
      image                        = container.value.image
      cpu                          = container.value.cpu
      memory                       = container.value.memory
      environment_variables        = container.value.environment_variables
      secure_environment_variables = container.value.secure_environment_variables
      commands                     = container.value.commands

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
    for_each = local.containers_config

    content {
      identity_ids = container.value.identity_ids
      type         = "UserAssigned" #coalesce(container.value.identity_ids, "UserAssigned")
    }
  }
  tags = merge(var.extra_tags, local.shared_tags)
}
