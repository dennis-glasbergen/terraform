# Create vnet and subnets for Networking Services
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/24"]

  tags = var.tags
}


# Create a Azure Firewall Subnet
resource "azurerm_subnet" "afwsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.192/26"]
}

# Create Gateway Subnet
resource "azurerm_subnet" "gwsubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.160/27"]
}

# Create private DNS zone
resource "azurerm_private_dns_zone" "intra" {
  name                = "intra.dhlparcel.io"
  resource_group_name = azurerm_resource_group.rg.name
}

# Create private DNS zone
resource "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.westeurope.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg.name
}

# Link intra private DNS to vnet
resource "azurerm_private_dns_zone_virtual_network_link" "intra" {
  name                  = "vnet-${var.rg_prefix}"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.intra.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}

# Link aks private DNS to vnet
resource "azurerm_private_dns_zone_virtual_network_link" "aks" {
  name                  = "vnet-${var.rg_prefix}"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.aks.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = false
}
