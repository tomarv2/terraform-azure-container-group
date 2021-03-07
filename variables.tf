variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "rg_name" {
}

variable "rg_location" {
  default = "eastus"
}

variable "env_variables" {
}

variable "cmd" {
  default = []
}

variable "num_of_containers" {
  default = 1
}

variable "restart_policy" {
  default = "OnFailure"
}

variable "ip_address_type" {
  default = "Public"
}

variable "os_type" {
  default = "Linux"
}

variable "cpu_allocation" {
  default = "0.5"
}

variable "mem_allocation" {
  default = "1.0"
}

variable "container_port" {
  default = "443"
}

variable "container_protocol" {
  default = "TCP"
}

variable "docker_image" {
}

//# READINESS & LIVENESS PROBE
//variable "probe_cmd_exec" {
//    default = ["cat", "/dev/null"]
//}

variable "initial_delay_seconds" {
  default = "30"
}

variable "period_seconds" {
  default = "30"
}

variable "failure_threshold" {
  default = "5"
}

variable "success_threshold" {
  default = "3"
}

variable "timeout_seconds" {
  default = "30"
}

# VOLUME
variable "mount_path" {
  default = "/mnt"
}

variable "add_msi" {
  description = "Do you want to add MSI(Note: this is a feature flag)"
  default     = false
}

variable "add_resourcegroup" {
  description = "Do you want to add a new Resource Group(Note: this is a feature flag)"
  default     = false
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}

variable "identity_type" {
  default = "UserAssigned"
}

variable "msi_name" {
  default = null
}


variable "aci_depends_on" {
  default = null
}

variable "scopes" {
  //  type        = list(string)
  //  default     = []
  description = "A list of scopes the role assignment applies to."
}