variable "rg_prefix" {
  description = "Resource Name"
}

variable "rg_prefix_short" {
  description = "Resource Name Short"
}

variable "location" {
  description = "Location"
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


