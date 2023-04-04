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

  config = {
    demo = {
        resource_group    = "cloud-custodian"
        extra_tags        = var.extra_tags
        identity          = var.identity != null ? var.identity : null
        #exposed_port      = [{ port = 8443, protocol = "TCP" }][{ port = 8443, protocol = "TCP" }]
        containers_config = {
          demo-container = {
            image  = "redis"
            cpu    = 1
            memory = 2
            ports = [{
              port     = 443
              protocol = "TCP"
            }]
            commands = ["/usr/local/bin/python3",
              "-m",
              "hello_world",
            ]
            environment_variables = {
              "AZURE_CONTAINER_LOG_GROUP" = "azure://12345"
            }
          }
        }
      }
    }

}
