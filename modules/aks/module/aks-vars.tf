variable "aks_agent_os_disk_size" {
  description = "Node pool agent disk size"
  default     = 128
}

variable "aks_agent_min_count" {
  description = "AKS Agent minimal count"
}

variable "aks_agent_max_count" {
  description = "AKS Agent maximal count"
}

variable "aks_agent_node_count" {
  description = "AKS Agent default count"
}

variable "aks_agent_vm_size" {
  description = "VM size"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
}

variable "aks_pod_cidr" {
  description = "CIDR notation IP range from which to assign pod IPs"
}

variable "aks_service_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
}

variable "aks_dns_service_ip" {
  description = "DNS server IP address"
}

variable "aks_docker_bridge_cidr" {
  description = "CIDR notation IP for Docker bridge"
}

variable "aks_enable_rbac" {
  description = "Enable RBAC on the AKS cluster"
}

variable "private_cluster_enabled" {
  description = "Enable private AKS cluster"
}