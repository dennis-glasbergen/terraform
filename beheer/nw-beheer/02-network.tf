# Create vnet and subnets for beheer networking
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/16"]

  tags = var.tags
}

# Create subnet for Automation
resource "azurerm_subnet" "automation" {
  name                                           = "sn-${var.rg_prefix_short}-automation"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.0.0/26"]
}

# Create subnet for Authentication
resource "azurerm_subnet" "authentication" {
  name                 = "sn-${var.rg_prefix_short}-authentication"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.64/26"]
}

# Create subnet for Monitoring
resource "azurerm_subnet" "monitoring" {
  name                 = "sn-${var.rg_prefix_short}-monitoring"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.128/26"]
} 

# Create subnet for Terraform State File
resource "azurerm_subnet" "terraform" {
  name                                           = "sn-${var.rg_prefix_short}-terraform"
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  enforce_private_link_endpoint_network_policies = true
  address_prefixes                               = ["${var.address_space_prefix}.0.192/26"]
}


# Create subnet for AKS
# resource "azurerm_subnet" "aks" {
#  name                                           = "sn-aks-${var.rg_prefix_short}"
#  resource_group_name                            = azurerm_resource_group.rg.name
#  virtual_network_name                           = azurerm_virtual_network.vnet.name
#  enforce_private_link_endpoint_network_policies = true
#  service_endpoints				 = [ "Microsoft.Sql" ]
#  address_prefixes                               = ["${var.address_space_prefix}.1.0/25"]
#}

# Create subnet for AGW
# resource "azurerm_subnet" "agw" {
#   name                                           = "sn-agw-${var.rg_prefix_short}"
#  resource_group_name                            = azurerm_resource_group.rg.name
#  virtual_network_name                           = azurerm_virtual_network.vnet.name
#  enforce_private_link_endpoint_network_policies = true
#  service_endpoints                              = [ "Microsoft.Sql" ]
#  address_prefixes                               = ["${var.address_space_prefix}.1.128/25"]
#}


# Link intra private DNS to vnet
resource "azurerm_private_dns_zone_virtual_network_link" "intra" {
  name                  = "${var.rg_prefix}-vnet-link"
  resource_group_name   = "rg-nw-services"
  private_dns_zone_name = "intra.dhlparcel.io"
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = true
}

# Link aks private DNS to vnet
#resource "azurerm_private_dns_zone_virtual_network_link" "aks" {
#  name                  = "${var.rg_prefix}-vnet-link"
#  resource_group_name   = "rg-nw-services"
#  private_dns_zone_name = "privatelink.westeurope.azmk8s.io"
#  virtual_network_id    = azurerm_virtual_network.vnet.id
#  registration_enabled  = false
#}
