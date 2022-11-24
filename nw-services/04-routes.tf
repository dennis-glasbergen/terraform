# Create route table for Azure Firewall
resource "azurerm_route_table" "networking" {
  name                          = "${var.rg_prefix}-rt-fw"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  disable_bgp_route_propagation = false

  route {
    name                   = "route-to-beheer"
    address_prefix         = "172.20.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-test"
    address_prefix         = "172.17.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-accept"
    address_prefix         = "172.18.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-prod"
    address_prefix         = "172.19.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  tags = var.tags
}

# Link route table for networking to VPN Gateway Subnet
resource "azurerm_subnet_route_table_association" "networking" {
  subnet_id      = azurerm_subnet.gwsubnet.id
  route_table_id = azurerm_route_table.networking.id
}