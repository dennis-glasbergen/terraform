data "azurerm_client_config" "current" {
}

data "azurerm_subnet" "svdwl" {
  name                 = "sn-${var.sn_prefix_svdwl}"
  virtual_network_name = "vnet-${var.rg_prefix_network}"
  resource_group_name  = "rg-${var.rg_prefix_network}"
}

data "azurerm_subnet" "svddb" {
  name                 = "sn-${var.sn_prefix_svddb}"
  virtual_network_name = "vnet-${var.rg_prefix_network}"
  resource_group_name  = "rg-${var.rg_prefix_network}"
}

data "azurerm_subnet" "svdps" {
  name                 = "sn-${var.sn_prefix_svdps}"
  virtual_network_name = "vnet-${var.rg_prefix_network}"
  resource_group_name  = "rg-${var.rg_prefix_network}"
}
