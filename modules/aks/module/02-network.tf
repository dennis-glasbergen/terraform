# Create NSG for AKS subnet
resource "azurerm_network_security_group" "aks" {
  name                = "nsg-${var.rg_prefix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  dynamic "security_rule" {
    for_each = var.rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  security_rule {
    name                       = "DenyAll"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "*"
    destination_address_prefix = data.azurerm_subnet.aks.address_prefixes[0]
  }

  tags = var.tags
}

# Link AKS subnet to AKS NSG
resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id                 = data.azurerm_subnet.aks.id
  network_security_group_id = azurerm_network_security_group.aks.id
}