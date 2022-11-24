resource "azurerm_virtual_network_peering" "environment-to-nw-services" {
  name                         = "${var.rg_prefix_short}-to-nw-services"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.nw_services.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = true
}

resource "azurerm_virtual_network_peering" "nw-services-to-environment" {
  name                         = "nw-services-to-${var.rg_prefix_short}"
  resource_group_name          = var.rg_nw_services
  virtual_network_name         = data.azurerm_virtual_network.nw_services.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}

