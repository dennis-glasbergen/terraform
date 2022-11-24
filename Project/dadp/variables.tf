variable "rg_prefix" {
  type = string
  description = "Resource Name"
}

variable "rg_prefix_short" {
  description = "Resource Name"
}

variable "location" {
  description = "Location"
}

variable "rg_subnet_prefix" {
  description = "subnet"
  
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

variable "rg_datafactory" {
  description = "rescource datafactory"
}

variable "virtualmachines" {
  type = list(object({
    hostname        = string
    size            = string
    offer           = string
    publisher       = string
    sku             = string
    version         = string
    osdisk_size     = number
    create_datadisk = bool
    datadisk_size   = number
    zone            = number
  }))
}