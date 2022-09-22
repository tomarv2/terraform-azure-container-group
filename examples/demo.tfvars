location = "westus2"
os_type = "Linux"
exposed_port = [{port = 8443, protocol = "TCP"}]
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
      "AZURE_CONTAINER_LOG_GROUP"           = "azure://12345"
    }
  }
}
