# Create NSG for svdwl subnet
resource "azurerm_network_security_group" "svdwl" {
  name                = "nsg-${var.rg_prefix}-svdwl"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location


  dynamic "security_rule" {
    for_each = var.sec_rules_svdwl
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefixes    = security_rule.value.source_address_prefixes
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  security_rule {
    name                       = "AllowTrafficWithinSubnet"
    priority                   = 4095
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    source_address_prefix      = data.azurerm_subnet.svdwl.address_prefixes[0]
    destination_port_range     = "*"
    destination_address_prefix = data.azurerm_subnet.svdwl.address_prefixes[0]
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
    destination_address_prefix = data.azurerm_subnet.svdwl.address_prefixes[0]
  }

  tags = var.tags
}



# Link Automation subnet to svdwl NSG
resource "azurerm_subnet_network_security_group_association" "svdwl" {
  subnet_id                 = data.azurerm_subnet.svdwl.id
  network_security_group_id = azurerm_network_security_group.svdwl.id
}

