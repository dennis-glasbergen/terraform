data "azurerm_client_config" "current" {
}

data "azurerm_virtual_network" "nw_beheer" {
  name                = "vnet-nw-beheer"
  resource_group_name = "rg-nw-beheer"
}

data "azurerm_subnet" "monitoring" {
  name                 = "sn-beheer-monitoring"
  virtual_network_name = "vnet-nw-beheer"
  resource_group_name  = "rg-nw-beheer"
}