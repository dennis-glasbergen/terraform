variable "rg_prefix" {
  description = "Resource Name"
}

variable "location" {
  description = "Location"
}

variable "address_space_prefix" {
  description = "VNET address prefix"
}

variable "vm_user_name" {
  description = "User name for the VM"
}

variable "public_ssh_key_path" {
  description = "Public key path for SSH."
}

variable "tags" {
  type = map(any)
}
