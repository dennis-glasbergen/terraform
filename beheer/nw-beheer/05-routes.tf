# Create route table for Azure Firewall
resource "azurerm_route_table" "route" {
  name                          = "${var.rg_prefix}-rt-fw"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  disable_bgp_route_propagation = false

  route {
    name                   = "to-nw-services"
    address_prefix         = "172.16.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-services-vpn"
    address_prefix         = "172.22.200.0/23"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

route {
    name                   = "to-nw-test"
    address_prefix         = "172.17.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-accept"
    address_prefix         = "172.18.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {
    name                   = "to-nw-prod"
    address_prefix         = "172.19.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  tags = var.tags
}

# Link route table to Automation Subnet
resource "azurerm_subnet_route_table_association" "automation" {
  subnet_id      = azurerm_subnet.automation.id
  route_table_id = azurerm_route_table.route.id
}

# Link route table to Authentication Subnet
resource "azurerm_subnet_route_table_association" "authentication" {
  subnet_id      = azurerm_subnet.authentication.id
  route_table_id = azurerm_route_table.route.id
}

# Link route table to Monitoring Subnet
resource "azurerm_subnet_route_table_association" "monitoring" {
  subnet_id      = azurerm_subnet.monitoring.id
  route_table_id = azurerm_route_table.route.id
}