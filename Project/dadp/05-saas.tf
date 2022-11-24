# Create DataFactory
resource "azurerm_data_factory" "df" {
  name                   = "df-${var.rg_prefix}-0001"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  public_network_enabled = false

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

