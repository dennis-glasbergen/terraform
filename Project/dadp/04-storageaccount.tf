# Create Storage Account for Datalake
resource "azurerm_storage_account" "storagedatalake" {
  name                     = "sa${replace(var.rg_prefix, "-", "")}0001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Datalake Storage
resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = "dl-${var.rg_prefix}-0001"
  storage_account_id = azurerm_storage_account.storagedatalake.id
}
