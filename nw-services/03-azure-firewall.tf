# Create Public IP Firewall
resource "azurerm_public_ip" "afw" {
  name                = "${var.rg_prefix}-afw-pubip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags

}

# Create a Firewall
resource "azurerm_firewall" "afw" {
  name                = "${var.rg_prefix}-afw"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name          = "AZFW_VNet"
  sku_tier          = "Standard"
  threat_intel_mode = "Off"

  ip_configuration {
    name                 = "afwipconfig"
    subnet_id            = azurerm_subnet.afwsubnet.id
    public_ip_address_id = azurerm_public_ip.afw.id
  }

  firewall_policy_id = azurerm_firewall_policy.policy.id

  tags = var.tags

}

# Create a Firewall Policy
resource "azurerm_firewall_policy" "policy" {
  name                = "${var.rg_prefix}-afw-policy"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku = "Standard"

  dns {
    proxy_enabled = true
  }

  tags = var.tags
}
