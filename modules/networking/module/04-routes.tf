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
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  route {                  
    name                   = "route-to-nw-services"
    address_prefix         = "172.16.0.0/24"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = data.azurerm_firewall.afw.ip_configuration[0].private_ip_address
  }

  tags = var.tags
}

# Link route table for networking to aks Subnet
#resource "azurerm_subnet_route_table_association" "aks" {
#  subnet_id      = azurerm_subnet.aks.id
#  route_table_id = azurerm_route_table.networking.id
#}

# Link route table for networking to agw Subnet
#resource "azurerm_subnet_route_table_association" "agw" {
#  subnet_id      = azurerm_subnet.agw.id
#  route_table_id = azurerm_route_table.networking.id
#}

