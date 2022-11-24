variable "rg_prefix" {
  description = "Resource Name"
}

variable "rg_prefix_short" {
  description = "Resource Name Short"
}

variable "env_rg_name_prefix" {
  description = "Environment rg prefix"
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

variable "infra_aad_group" {
}

variable "tags" {
  type = map(any)
}


