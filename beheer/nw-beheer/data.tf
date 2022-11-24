data "azurerm_virtual_network" "nw_services" {
  name                = "vnet-nw-services"
  resource_group_name = "rg-nw-services"
}

data "azurerm_firewall" "afw" {
  name                = "nw-services-afw"
  resource_group_name = "rg-nw-services"
}