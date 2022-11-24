data "azurerm_client_config" "current" {
}

data "azurerm_private_dns_zone" "vpngw" {
  name                = "intra.dhlparcel.io"
  resource_group_name = "rg-nw-services"
}

data "azurerm_virtual_network" "environment" {
  name                = "${var.env_rg_name_prefix}-vnet"
  resource_group_name = "rg-${var.env_rg_name_prefix}"
}

data "azurerm_subnet" "aks" {
  name                 = "sn-aks-test"
  virtual_network_name = "${var.env_rg_name_prefix}-vnet"
  resource_group_name  = "rg-${var.env_rg_name_prefix}"
}

data "azurerm_subnet" "agw" {
  name                 = "sn-agw-test"
  virtual_network_name = "${var.env_rg_name_prefix}-vnet"
  resource_group_name  = "rg-${var.env_rg_name_prefix}"
}

data "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.westeurope.azmk8s.io"
  resource_group_name = "rg-weu-dhl-vpngw"
}

data "azuread_group" "infra_aad_group" {
  display_name = var.infra_aad_group
}

data "azurerm_resource_group" "mc" {
  name = "rg-aks-test-nodes"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_user_assigned_identity" "mc" {
  name                = "${var.rg_prefix}-aks-agentpool"
  resource_group_name = data.azurerm_resource_group.mc.name

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_resources" "routetable" {
  resource_group_name = "rg-aks-test-nodes"
  type                = "Microsoft.Network/routeTables"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_route_table" "aks_route" {
  #name                = data.azurerm_resources.routetable.name
  name                = "aks-agentpool-35862059-routetable"
  resource_group_name = "rg-aks-test-nodes"

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

data "azurerm_route_table" "test" {
  name                = "${var.env_rg_name_prefix}-rt-fw"
  resource_group_name = "rg-${var.env_rg_name_prefix}"
}
