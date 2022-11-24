# Create NSG for AKS subnet
resource "azurerm_network_security_group" "aks" {
  name                = "nsg-aks${var.rg_prefix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "AllowHTTPExternal"
    priority                   = 202
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTPsExternal"
    priority                   = 203
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "443"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

# Create NSG for AGW subnet
resource "azurerm_network_security_group" "agw" {
  name                = "nsg-agw-${var.rg_prefix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location



  security_rule {
    name                       = "AllowForAGW"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "GatewayManager"
    destination_port_range     = "65200-65535"
    destination_address_prefix = "*"
  }

  #  security_rule {
  #    name                       = "AllowHTTPInternal"
  #    priority                   = 200
  #    direction                  = "Inbound"
  #    access                     = "Allow"
  #    protocol                   = "Tcp"
  #    source_port_range          = "*"
  #    source_address_prefix      = "*"
  #    destination_port_range     = "80"
  #    destination_address_prefix = data.azurerm_subnet.agw.address_prefixes[0]
  #  }

  #  security_rule {
  #    name                       = "AllowHTTPsInternal"
  #    priority                   = 201
  #    direction                  = "Inbound"
  #    access                     = "Allow"
  #    protocol                   = "Tcp"
  #    source_port_range          = "*"
  #    source_address_prefix      = "*"
  #    destination_port_range     = "443"
  #    destination_address_prefix = data.azurerm_subnet.agw.address_prefixes[0]
  #  }

  security_rule {
    name                       = "AllowHTTPExternal"
    priority                   = 202
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTPsExternal"
    priority                   = 203
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "443"
    destination_address_prefix = "*"
  }

  tags = var.tags

}

# Link AKS subnet to AKS NSG
resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id                 = data.azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}

# Link AGW subnet to AGW NSG
resource "azurerm_subnet_network_security_group_association" "agw" {
  subnet_id                 = data.azurerm_subnet.agw.id
  network_security_group_id = azurerm_network_security_group.agw.id
}
