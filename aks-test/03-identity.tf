# User Assigned Identities 
resource "azurerm_user_assigned_identity" "uaidentity" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name = "identity-${var.rg_prefix}"

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "acridentity" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name = "acr-identity-${var.rg_prefix}"
}
