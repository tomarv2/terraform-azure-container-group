variable "teamid" {
  description = "Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "env_variables" {
  description = "Environment variables"
  type        = map(any)
  default     = {}
}

variable "cmd" {
  description = "cmd"
  type        = list(any)
  default     = []
}

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

variable "cpu_allocation" {
  description = "CPU allocation"
  default     = "0.5"
  type        = string
}

variable "mem_allocation" {
  description = "Memory allocation"
  default     = "1.0"
  type        = string
}

variable "container_port" {
  description = "Container port"
  default     = "443"
  type        = string
}

variable "container_protocol" {
  description = "Container protocol"
  default     = "TCP"
  type        = string
}

variable "docker_image" {
  description = "Docker image"
  type        = string
}

variable "location" {
  description = " The location/region where the resource is created. Changing this forces a new resource to be created"
  default     = "westus2"
  type        = string
}
