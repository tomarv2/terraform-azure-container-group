variable "num_of_containers" {
  description = "Number of containers"
  type        = number
  default     = 1
}

variable "restart_policy" {
  description = "Restart policy"
  default     = "OnFailure"
  type        = string
}

variable "ip_address_type" {
  description = "IP address type"
  default     = "Public"
  type        = string
}

variable "os_type" {
  description = "OS type"
  default     = "Linux"
  type        = string
}

variable "location" {
  description = " The location/region where the resource is created. Changing this forces a new resource to be created"
  default     = "westus2"
  type        = string
}


variable "containers_config" {
  description = <<EOD
Containers configurations, defined by this type:
```
map(
  container-name (string) : object({
    image                        = string
    cpu                          = number
    memory                       = number
    environment_variables        = optional(map)
    secure_environment_variables = optional(map)
    commands                     = optional(list)
    ports = list(object({
      port     = number
      protocol = string
    }))
  })
)
```
EOD
  type        = map(any)
  default     = {}
}

variable "extra_tags" {
  description = "Additional tags to associate"
  type        = map(string)
  default     = {}
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Container Group. Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both)."
  type        = map(any)
  default     = null
}

variable "exposed_port" {
  description = "The port number the container will expose. Changing this forces a new resource to be created."
  default     = []
  type        = list(map(any))
}

variable "environment_variables" {
  description = "A list of environment variables to be set on the container. Specified as a map of name/value pairs. Changing this forces a new resource to be created."
  type        = map(any)
  default     = null
}