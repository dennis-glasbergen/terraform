variable "rg_prefix" {
  description = "Resource Name"
}

variable "rg_prefix_short" {
  description = "Resource Name Short"
}

variable "rg_nw_prefix" {
  description = "Networking Prefix"
}

variable "rg_nw_prefix_short" {
  description = "Networking Prefix Short"
}

variable "rg_cluster_prefix" {
  description = "AKS Cluster Prefix"
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

variable "rules" {
  description = "Firewall Rules"
}

variable "infra_aad_group" {
  description = "Admin Group for AKS Admins"
}

variable "tags" {
  type = map(any)
}