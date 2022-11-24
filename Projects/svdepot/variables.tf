variable "rg_prefix" {
  description = "Resource Name"
}

variable "rg_prefix_short" {
  description = "Resource Name"
}

variable "sn_prefix_svddb" {
  description = "subnet name"
}

variable "sn_prefix_svdwl" {
  description = "subnet name"
}

variable "sn_prefix_svdps" {
  description = "subnet name"
}

variable "location" {
  description = "Location"
}

variable "tags" {
  type = map(any)
}

variable "rg_prefix_network" {
  description = "rescource network"
}
variable "vm_user_name" {
  description = "User name for the VM"
}

variable "public_ssh_key_path" {
  description = "Public key path for SSH."
}

variable "sec_rules_svdwl" {
}


variable "virtualmachines-wl" {
  type = list(object({
    hostname        = string
    location        = string
    size            = string
    offer           = string
    publisher       = string
    sku             = string
    version         = string
    osdisk_size     = number
    create_datadisk = bool
    datadisk_size   = number
    zone            = number
    vm_tags         = map(any)
  }))
}
