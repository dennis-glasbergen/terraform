data "azurerm_client_config" "current" {
}

data "azurerm_subnet" "dadp" {
  name                 = "sn-${var.rg_subnet_prefix}"
  virtual_network_name = "vnet-${var.rg_prefix_network}"
  resource_group_name  = "rg-${var.rg_prefix_network}"
}



