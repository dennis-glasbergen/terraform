# Create a Peering between Beheer and NW-Services
resource "azurerm_virtual_network_peering" "beheer_to_nw_services" {
  name                         = "${var.rg_prefix_short}-to-nw-services"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.nw_services.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = true
}

#Create a Peering Between NW-Services and Beheer
resource "azurerm_virtual_network_peering" "nw_services_to_beheer" {
  name                         = "nw-services-to-${var.rg_prefix_short}"
  resource_group_name          = "rg-nw-services"
  virtual_network_name         = data.azurerm_virtual_network.nw_services.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
}
