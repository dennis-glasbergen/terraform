resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.rg_prefix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = var.rg_prefix_short

  linux_profile {
    admin_username = var.vm_user_name
    ssh_key {
      key_data = file(var.public_ssh_key_path)
    }
  }

  node_resource_group     = "rg-${var.rg_prefix}-nodepool"
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = "true"
  private_dns_zone_id     = data.azurerm_private_dns_zone.aks.id

  addon_profile {
    http_application_routing {
      enabled = false
    }
    kube_dashboard {
      enabled = false
    }
  }

  default_node_pool {
    name                  = "agentpool01"
    availability_zones    = [1, 2, 3]
    enable_node_public_ip = false
    node_count            = var.aks_agent_count
    vm_size               = var.aks_agent_vm_size
    os_disk_size_gb       = var.aks_agent_os_disk_size
    vnet_subnet_id        = data.azurerm_subnet.aks.id
  }

  identity {
    type                      = "UserAssigned"
    user_assigned_identity_id = azurerm_user_assigned_identity.uaidentity.id
  }

  network_profile {
    network_plugin     = "kubenet"
    network_policy     = "calico"
    dns_service_ip     = var.aks_dns_service_ip
    docker_bridge_cidr = var.aks_docker_bridge_cidr
    service_cidr       = var.aks_service_cidr
  }

  role_based_access_control {
    enabled = var.aks_enable_rbac
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [data.azuread_group.infra_aad_group.object_id]
    }
  }

  depends_on = [
    azurerm_role_assignment.ra5,
    azurerm_role_assignment.ra6
    #azurerm_role_assignment.ra10
  ]

  # Added this to prevent recreation
  lifecycle {
    ignore_changes = [
      addon_profile,
      default_node_pool.0.node_count # Ignore changes made by autoscaling
    ]
  }

  tags = var.tags
}
