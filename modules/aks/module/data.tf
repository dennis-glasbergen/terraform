data "azurerm_virtual_network" "nw" {
  name                = "vnet-${var.rg_nw_prefix}"
  resource_group_name = "rg-${var.rg_nw_prefix}"
}

data "azurerm_subnet" "aks" {
  name                 = "sn-${var.rg_nw_prefix_short}-aks-${var.rg_cluster_prefix}"
  virtual_network_name = "vnet-${var.rg_nw_prefix}"
  resource_group_name  = "rg-${var.rg_nw_prefix}"
}

data "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.westeurope.azmk8s.io"
  resource_group_name = "rg-nw-services"
}


data "azuread_group" "infra_aad_group" {
  display_name = var.infra_aad_group
}

data "azurerm_resource_group" "mc" {
  name = "rg-${var.rg_prefix}-nodepool"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_user_assigned_identity" "mc" {
  name                = "aks-${var.rg_prefix}-agentpool"
  resource_group_name = "rg-${var.rg_prefix}-nodepool"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_resources" "aks_routetable" {
  resource_group_name = "rg-${var.rg_prefix}-nodepool"
  type	              = "Microsoft.Network/routeTables/routes"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

#data "azurerm_route_table" "aks_route" {
#  name                = data.azurerm_resources.aks_routetable.name
#  resource_group_name = "rg-${var.rg_prefix}-nodepool"
#
#  depends_on = [
#    azurerm_kubernetes_cluster.aks
#  ]
#}
