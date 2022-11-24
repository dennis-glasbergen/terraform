# Create vnet and subnets for environment
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/16"]

  tags = var.tags
}

# Link private DNS to vnet
resource "azurerm_private_dns_zone_virtual_network_link" "dns" {
  name                  = "${var.rg_prefix}-vnet-link"
  resource_group_name   = var.rg_nw_services
  private_dns_zone_name = "intra.dennisg.io"
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}

# Create subnet for AKS cluster1
resource "azurerm_subnet" "akscl1" {
  name                                           = "sn-${var.rg_prefix_short}-aks-cl1"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.1.0/26"]

}

# Create subnet for svdepo  svdwl 
resource "azurerm_subnet" "svdwl" {
  name                                           = "sn-${var.rg_prefix_short}-svdwl"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.2.0/28"]
}

# Create subnet for svdepo  svddb 
resource "azurerm_subnet" "svddb" {
  name                                           = "sn-${var.rg_prefix_short}-svddb"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.2.16/28"]
}

# Create subnet for svdepo  svdps 
resource "azurerm_subnet" "svdps" {
  name                                           = "sn-${var.rg_prefix_short}-svdps"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.2.32/28"]
}

# Create subnet for DADP
resource "azurerm_subnet" "dapd" {
  name                                           = "sn-${var.rg_prefix_short}-dadp"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.0.128/25"]

}

# Create subnet for AKS
#resource "azurerm_subnet" "agw" {
#  name                                           = "sn-agw-${var.rg_prefix_short}"
#  resource_group_name                            = azurerm_resource_group.rg.name
#  virtual_network_name                           = azurerm_virtual_network.vnet.name
#  enforce_private_link_endpoint_network_policies = true
#  service_endpoints                              = [ "Microsoft.Sql" ]
#  address_prefixes                               = ["${var.address_space_prefix}.0.128/25"]
#}

