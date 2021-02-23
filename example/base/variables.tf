variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "rg_location" {
  default = "eastus"
}

variable "env_variables" {}

variable "cmd" {
  default = []
}

variable "docker_image" {}

# READINESS & LIVENESS PROBE
variable "probe_cmd_exec" {
    default = ["cat", "/dev/null"]
}

# VOLUME
variable "mount_path" {
    default = "/mnt"
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

variable "add_msi" {
  description = "Do you want to add MSI(Note: this is a feature flag)"
  default = false
}

variable "msi_name" {
  default = null
}

variable "rg_name" {
  default = null
}

variable "add_resourcegroup" {
  description = "Do you want to add a new Resource Group(Note: this is a feature flag)"
  default = false
}

variable "container_port" {
  default = [80]
}

variable "cpu_allocation" {
  default = "0.5"
}

variable "mem_allocation" {
  default = "1.0"
}

variable "ip_address_type" {
  default = "Public"
}

variable "scopes" {
//  type        = list(string)
//  default     = []
  description = "A list of scopes the role assignment applies to."
}