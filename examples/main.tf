terraform {
  required_version = ">= 1.0.1"
  required_providers {
    azurerm = {
      version = "~> 3.21.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "container_group" {
  source = "../"

  resource_group    = "<resource_group_name>"
  containers_config = var.containers_config
  extra_tags        = var.extra_tags
  identity          = var.identity != null ? var.identity : { join("", flatten(module.msi.*.id)) = { type = "UserAssigned" } }
  exposed_port      = var.exposed_port
  teamid            = var.teamid
  prjid             = var.prjid
}
