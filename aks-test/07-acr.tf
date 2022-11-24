resource "azurerm_container_registry" "acr" {
  name                = "dhlintracr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = false

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.acridentity.id
    ]
  }

  tags = var.tags

}

resource "azurerm_private_endpoint" "acr" {
  name                = "acr-pe-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = data.azurerm_subnet.aks.id

  private_service_connection {
    name                           = "acr-pe-connection"
    private_connection_resource_id = azurerm_container_registry.acr.id
    is_manual_connection           = false
    subresource_names              = ["registry"]
  }
}
