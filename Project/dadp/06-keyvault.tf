# Create a Keyvault for saving secrets
resource "azurerm_key_vault" "kv" {
  name                       = "${var.rg_prefix}-kv-0001"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 90
  purge_protection_enabled   = false

  sku_name                        = "standard"
  enable_rbac_authorization       = true
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true

  tags = var.tags
}